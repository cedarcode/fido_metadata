# frozen_string_literal: true

require "spec_helper"
require "fido_metadata/table_of_contents"

RSpec.describe FidoMetadata::TableOfContents do
  let(:current_time) { Time.utc(2025, 1, 1, 0, 0, 0) }

  # Set timezone to UTC for the duration of the tests
  around do |ex|
    orig_tz = ENV["TZ"]
    ENV["TZ"] = "UTC"
    ex.run
    ENV["TZ"] = orig_tz
  end

  before do
    allow(Time).to receive(:now).and_return(current_time)
  end

  describe "#expires_in" do
    it "returns the number of seconds until nextUpdate" do
      toc = described_class.from_json("nextUpdate" => "2025-01-02T00:00:00Z")
      expect(toc.expires_in).to eq(86_400)
    end

    it "can return a negative number when nextUpdate is in the past" do
      toc = described_class.from_json("nextUpdate" => "2024-12-31T23:59:00Z")
      expect(toc.expires_in).to eq(-86_400)
    end
  end
end
