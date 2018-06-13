module Lita
  module Handlers
    class NetappUserQuota < Handler

        route(/networker show -c\s+(.+)/i, :show, command: true, help: { "networker show -c <CLIENT>" => "<USER> = username" })

        def show(response)
                client = response.matches[0][0].upcase
                server = "networker.cpcc.edu"
                cmd = "mminfo \-avotR \-c #{client} \-s networker.cpcc.edu \-q \"level=full\" \-r \"savetime(20),totalsize(9),name\""
                output = exec!(cmd)
                        if !output
                                response.reply("Command was run, but it appears there was no output")
                        else
                                response.reply(output.encode('utf-8'))
                        end
                end
        end

      Lita.register_handler(self)
    end
  end
