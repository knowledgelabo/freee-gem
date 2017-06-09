module Freee
  class Journal < Freee::Base

    # Freee::Journal.request_url(1, download_type:"csv", start_date:"2014-08-01", end_date:"2014-08-31")
    # args must be HASH, have SYMBOL KEY, not STRING.
    def self.request_url(company_id, **args)
      params = Freee.encode_params(args)
      Freee.client.get(
        "/api/1/journals?company_id=#{company_id}#{params}",
        :journal
      )
    end

    def self.status(company_id, report_id)
      params = Freee.encode_params({"company_id": company_id })
      Freee.client.get(
        "/api/1/journals/reports/#{report_id}/status?#{params}",
        :journal
      )
    end
    def self.download(company_id, report_id)
      params = Freee.encode_params({"company_id": company_id })
      puts query
      Freee.client.get(
        "/api/1/journals/reports/#{report_id}/download?#{params}" ,
        :csv
      )
    end
  end

end
