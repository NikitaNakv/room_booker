# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReportGeneratorJob, type: :job do
  describe "#perform_later" do
    it "queue a csv job" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        ReportGeneratorJob.perform_later("csv")
      end.to have_enqueued_job
    end
  end
end
