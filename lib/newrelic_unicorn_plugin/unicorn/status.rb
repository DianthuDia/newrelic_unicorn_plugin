module NewRelic::Plugin::Unicorn
  module Status
    attr_reader :pid_file

    def initialize(rails_root, pid_name)
      @pid_file = "#{rails_root}/tmp/pids/#{pid_name}"
    end

    private

    def master_pid
      File.read(pid_file).to_i
    end

    def worker_pids
      result = []
      ps_output = `ps w --ppid #{master_pid}`
      ps_output.split("\n").each do |line|
        chunks = line.strip.split(/\s+/, 5)
        pid, pcmd = chunks[0], chunks[4]
        next if pid !~ /\A\d+\z/ or pcmd !~ /worker/
        result << pid.to_i
      end
      result
    end
  end
end
