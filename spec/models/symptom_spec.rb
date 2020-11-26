require 'rails_helper'

RSpec.describe Symptom, type: :model do
  before do
    @symptom = FactoryBot.build(:symptom)
  end

  describe '症状記入' do
    context '新規症状記入がうまくいくとき' do
      it 'ccとfrom_whenとwhereとsituationとphとallergiesとmedicineが存在すれば登録できる' do
        expect(@symptom).to be_valid
      end
    end

    context '新規症状記入がうまくいかないとき' do
      it 'ccが空だと登録できない' do
        @symptom.cc = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Cc can't be blank")
      end
      it 'from_whenが空だと登録できない' do
        @symptom.from_when = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("From when can't be blank")
      end
      it 'whereが空だと登録できない' do
        @symptom.where = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Where can't be blank")
      end
      it 'situationが空だと登録できない' do
        @symptom.situation = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Situation can't be blank")
      end
      it 'phが空だと登録できない' do
        @symptom.ph = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Ph can't be blank")
      end
      it 'allergiesが空だと登録できない' do
        @symptom.allergies = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Allergies can't be blank")
      end
      it 'medicineが空だと登録できない' do
        @symptom.medicine = ''
        @symptom.valid?
        expect(@symptom.errors.full_messages).to include("Medicine can't be blank")
      end
    end
  end
end
