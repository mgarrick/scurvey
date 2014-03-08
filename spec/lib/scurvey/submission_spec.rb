require 'scurvey'

describe Scurvey::Submission do
  it "accepts a hash of responses" do
    described_class.new(responses: {bad: :good})
  end
end
