# See: https://github.com/munin-monitoring/contrib/blob/master/plugins/unicorn/unicorn_memory_status

#  unicorn_status - A munin plugin for Linux to monitor memory size of unicorn processes
#
#  Copyright (C) 2010 Shinji Furuya - shinji.furuya@gmail.com
#  Licensed under the MIT license:
#  http://www.opensource.org/licenses/mit-license.php

module NewRelic::Plugin::Unicorn
  class MemoryStatus
    include Status

    def total_memory
      result = 0
      memory = memory_usage
      result += memory[:master][master_pid]
      memory[:worker].each do |pid, worker_memory|
        result += worker_memory
      end
      result
    end

    private

    def memory_usage
      result = { :master => {master_pid => nil}, :worker => {} }
      ps_output = `ps auxw | grep unicorn`
      ps_output.split("\n").each do |line|
        chunks = line.strip.split(/\s+/, 11)
        pid, pmem_rss, _ = chunks.values_at(1, 5, 10)
        pmem = pmem_rss.to_i * 1024
        pid = pid.to_i

        if pid == master_pid
          result[:master][pid] = pmem
        elsif worker_pids.include?(pid)
          result[:worker][pid] = pmem
        end
      end
      result
    end
  end
end
