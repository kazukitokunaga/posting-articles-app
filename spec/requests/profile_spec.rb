require 'rails_helper'

RSpec.describe "/api/profiles.json", type: :request do
  describe "POST /profiles.json" do
    let(:domicile) { FactoryBot.create(:domicile) }
    let(:profile_params) { attributes_for(:profile) }
    let(:address_params) { [ attributes_for(:address) ] }
    let(:domicile_params) { [ attributes_for(:address) ] }
    before do
      profile_params[:address_attributes] = address_params
      profile_params[:domicile_attributes] = domicile_params
    end

    context "ログインしていない時" do
      context "postリクエストされた場合" do
        subject { post "/api/profiles.json", params: { profile: profile_params } }

        it "登録されない(モデルのレコードが増えない)" do
          expect { subject }.to change { Profile.count }.by(0)
        end
      end

    end

    context "ログインしている時" do
      before do
        login_as(domicile.profile.user)
      end

      context "すべて正常に送信された場合" do
        subject { post "/api/profiles.json", params: { profile: profile_params } }

        it "登録される(モデルのレコードが1増える)" do
          expect { subject }.to change { Profile.count }.by(1)
        end
      end

    end
  end

  describe "patch /api/profiles/id" do
    let(:profile){ FactoryBot.create(:profile) }
    let(:wrong_user){ FactoryBot.create(:user, :confirmed) }
    let(:updated_family_name) { "変更された姓" }

    subject {
      patch "/api/profiles/#{profile.id}.json",
      params: { profile: attributes_for(:profile, family_name: updated_family_name) }
    }

    context "ログインしていない時" do
      it "401エラーを返す" do
        subject
        expect(response).to have_http_status(401)
      end

      it "DBが更新されない" do
        expect { subject }.not_to change { profile.reload }
      end
    end

    context "該当のユーザーでログインしている時" do
      before do
        login_as(profile.user)
      end

      it "Successのレスポンスを返す" do
        subject
        expect(response).to be_successful
      end

      it "DBが更新される" do
        expect { subject }.to change { profile.reload.family_name }.to(updated_family_name)
      end

      it "更新されたprofileのハッシュを返す" do
        subject
        data = JSON.parse(response.body)
        expect(data["family_name"]).to eq(updated_family_name)
      end
    end

    context "異なるユーザーがログインしている時" do
      before do
        login_as(wrong_user)
      end

      it "403エラーを返す" do
        subject
        expect(response).to have_http_status(403)
      end

      it "DBが更新されない" do
        expect { subject }.not_to change { profile.reload }
      end
    end
  end

  describe "GET /api/profiles" do
    let!(:user){ FactoryBot.create(:user, :confirmed) }
    let!(:profile) { FactoryBot.create(:profile, user: user) }
    let(:wrong_user){ FactoryBot.create(:user, :confirmed) }
    let(:wrong_progile){ FactoryBot.create(:profile, user: wrong_user) }

    subject { get "/api/profiles.json" }

    context "該当のユーザーがログインしている時" do
      before do
        login_as(user)
      end

      it "Sucessレスポンスを返す" do
        subject
        expect(response).to be_successful
      end

      it "Responseがログインしているユーザーのレコードを持つ" do
        subject
        data = JSON.parse(response.body)
        expect(data["id"]).to eq(profile.id)
      end

      it "自分以外のユーザーのレコードとは一致しない" do
        subject
        data = JSON.parse(response.body)
        expect(data["id"]).not_to eq(wrong_progile.id)
      end
    end
  end
end