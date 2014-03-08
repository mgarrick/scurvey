require 'scurvey'
require 'scurvey/export/json'

describe Scurvey::Export::JSON do
  let(:key) { 'survey key' }
  let(:label) { 'survey label' }
  let(:survey) do
    Scurvey.start key, label: label do |s|
      s.question :question_key, label: 'question label' do |q|
        q.answer :answer_key, label: 'answer label'
      end
    end
  end
  let(:export) { described_class.new(survey) }

  describe :render do
    subject { JSON.parse(export.render, symbolize_names: true) }
    it { should eq(
      {survey:
       {key: key,
        label: label,
        questions: [{key: "question_key", label: "question label",
         answers: [{key: "answer_key", label: "answer label"}],
        }]
       }
      }
     )
    }
  end
end
