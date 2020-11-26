require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before do
    @doctor = FactoryBot.build(:doctor)
  end

  describe 'ドクター新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemailとpasswordとpassword_confirmationとareaとspecialityとwordが存在すれば登録できる' do
        expect(@doctor).to be_valid
      end
      it 'パスワードが６文字以上であれば登録できる' do
        @doctor.password = 'a00000'
        @doctor.password_confirmation = 'a00000'
        expect(@doctor).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @doctor.name = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空だと登録できない' do
        @doctor.email = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @doctor.save
        another_doctor = FactoryBot.build(:doctor)
        another_doctor.email = @doctor.email
        another_doctor.valid?
        expect(another_doctor.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@マークが含まれていないと登録できない' do
        @doctor.email = 'aaaaaaa'
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @doctor.password = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが５文字以下だと登録できない' do
        @doctor.password = '1a111'
        @doctor.password_confirmation = '1a111'
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @doctor.password_confirmation = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'areaが空だと登録できない' do
        @doctor.area = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Area can't be blank")
      end
      it 'specialityが空だと登録できない' do
        @doctor.speciality = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Speciality can't be blank")
      end
      it 'wordが空だと登録できないこと' do
        @doctor.word = ''
        @doctor.valid?
        expect(@doctor.errors.full_messages).to include("Word can't be blank")
      end
    end
  end
end
