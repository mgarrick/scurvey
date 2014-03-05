require_relative '../../lib/scurvey'

describe Scurvey do
  #let(:filename) { File.expand_path('../../app/surveys/diversity_survey.rb', File.dirname(__FILE__)) }

  context "opening a survey from a" do
    let(:key) { :key }
    let(:label) { 'Label' }

=begin
    it "string" do
      survey_string = <<-EOS
        survey #{key}, label: "#{label}" do
        end
      EOS
      s = Scurvey.load(survey_string)
      s.key.should == key
      s.label.should == label
    end

    #it "file"
=end

    it "block" do
      s = Scurvey.start do |s|
        s.key key
        s.label label

        s.question key, label: label do |q|
        #  q.answer key, label: label
        end
      end

      s.key.should == key
      s.label.should == label

      s.questions.first.key.should == key
      s.questions.first.label.should == label

=begin
      s.questions.first.answers.first.key.should == key
      s.questions.first.answers.first.label.should == label
=end
    end
  end

=begin
  it "parses questions" do
    s = Scurvey.begin do |s|
      s.key key
      s.label label

      survey :diversity, label: "Diversity Survey" do
        #section :demographic do
        #p "As a federal contractor, University of California is subject to bla bla bla"
        #p "Submission of this information is voluntary. Bla bla bla"

        question :sex, label: 'Sex' do
          answer :male, label: 'Male'
          answer :female, label: 'Female'
          answer :decline, label: 'Choose not to provide this information'
        end
        #end
      end
    EOS
    s = Scurvey.load(survey_string)
  end
=end
end
