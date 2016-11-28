class Download

	def self.download_login(response, connection, s)
		username = s.getUsername()
		result = connection.exec "select * from loginhistory where username = '#{username}' order by id desc"
		current_time, current_date = CurrentTime.calc_time
		
			Prawn::Document.generate("#{username.gsub(' ','_')}_history.pdf") do |pdf|
				pdf.text "Login History, Downloaded on : #{current_date}, #{current_time}\n\n\n\n"
				table_data = [["UserName", "time", "date"]]
				result.each {|row| json_row = row.to_json
				json_data = JSON.parse(json_row);table_data.push(["#{json_data['username']}","#{json_data['time']}","#{json_data['date']}"])}
				row_no = 0
				pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true }) do
					while row_no <= table_data.size
						row(0).background_color = "ff4d4d"
						row(row_no).background_color = "7fffd4"
						row(row_no + 1).background_color = "f5deb3"
						row_no += 2
					end
				end
				page_no=1
				no_of_pages = pdf.page_count
				while page_no <= no_of_pages do
					pdf.go_to_page(page_no)
					logo_width = 400
					pdf.float do
						pdf.transparent(0.2) do
							pdf.image 'png/Mahaswami Logo-01.png', :width => logo_width,
							:position => :center, :vposition => :center
						end
					end
					page_no += 1
				end
			end
		if response =~ /mail/
			s.setMailPdf(true)
			s.setPdfName(username)
		else
			system("mv #{username.gsub(' ','_')}_history.pdf /host_msuser1/Downloads")
			s.setMailPdf(false)
		end
	end

	def self.download_challenge(response, connection, s)
		username = s.getUsername()
		challenge_name = s.getChallengeName()
		result = connection.exec "select * from challengehistory where challenge_name = '#{challenge_name}' and username = '#{username}' order by id desc"
		current_time, current_date = CurrentTime.calc_time
		if result.count == 0
			Prawn::Document.generate("#{challenge_name.gsub(' ','_')}_history.pdf") do |pdf|
				pdf.text "Login History, Downloaded on : #{current_date}, #{current_time}\n\n\n\n History is empty!"
				logo_width = 400
				pdf.float do
					pdf.transparent(0.2) do
						pdf.image '../Images/Mahaswami Logo-01.png', :width => logo_width,
						:position => :center, :vposition => :center
					end
				end
			end
		else
			Prawn::Document.generate("#{challenge_name.gsub(' ','_')}_history.pdf") do |pdf|
				pdf.text "Challenge History, Downloaded on : #{current_date},#{current_time}\n\n"
				table_data = [["date","time","input","output"]]
				result.each {|row| json_row = row.to_json
				json_data = JSON.parse(json_row);table_data.push(["#{json_data['date']}","#{json_data['time']}","#{json_data['input']}","#{json_data['output']}"]) }
				row_no = 0
				pdf.table(table_data, :width => 500, :cell_style => { :inline_format => true }) do
					while row_no <= table_data.size
						row(0).background_color = "ff4d4d"
						row(row_no).background_color = "7fffd4"
						row(row_no + 1).background_color = "f5deb3"
						row_no += 2
					end
				end
				page_no=1
				no_of_pages = pdf.page_count
				while page_no <= no_of_pages do
					pdf.go_to_page(page_no)
					logo_width = 400
					pdf.float do
						pdf.transparent(0.2) do
							pdf.image 'png/Mahaswami Logo-01.png', :width => logo_width,
							:position => :center, :vposition => :center
						end
					end
				page_no += 1
				end
			end
		end
		if response =~ /mail/
			s.setMailPdf(true)
			s.setPdfName(challenge_name)
		else
			puts "#{challenge_name}"
			system("mv #{File.expand_path(File.dirname(__FILE__))}/#{challenge_name.gsub(' ','_')}_history.pdf /host_msuser1/Downloads")
			s.setMailPdf(true)
		end
	end

end
