# See: https://github.com/munin-monitoring/contrib/blob/master/plugins/unicorn/unicorn_status

#	unicorn_status - A munin plugin for Linux to monitor unicorn processes
#
#  Copyright (C) 2010 Shinji Furuya - shinji.furuya@gmail.com
#  Licensed under the MIT license:
#  http://www.opensource.org/licenses/mit-license.php

module NewRelic::Plugin::Unicorn
  class WorkerStatus
    include Status

    def worker_count
      worker_pids.size
    end

    def idle_worker_count
      result = 0
      before_cpu = {}
      worker_pids.each do |pid|
        before_cpu[pid] = cpu_time(pid)
      end
      sleep 1
      after_cpu = {}
      worker_pids.each do |pid|
        after_cpu[pid] = cpu_time(pid)
      end
      worker_pids.each do |pid|
        result += 1 if after_cpu[pid] - before_cpu[pid] == 0
      end
      result
    end

    private

    def cpu_time(pid)
      usr, sys = `cat /proc/#{pid}/stat | awk '{print $14,$15 }'`.strip.split(/\s+/).collect { |i| i.to_i }
      usr + sys
    end
  end

end
