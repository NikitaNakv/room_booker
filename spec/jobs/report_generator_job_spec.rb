# frozen_string_literal: true

require "rails_helper"

RSpec.describe ReportGeneratorJob, type: :job do
  context "csv format" do
    ReportGeneratorJob.perform_later "csv"
  end

  context "excel format" do
    ReportGeneratorJob.perform_later "excel"
  end
end
