require "rails_helper"

RSpec.describe NotificationSite, type: :mailer do
  describe "notify_invitation" do
    let(:mail) { NotificationSite.notify_invitation }

    it "renders the headers" do
      expect(mail.subject).to eq("Notify invitation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
