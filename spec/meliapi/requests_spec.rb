# frozen_string_literal: true

RSpec.describe Meliapi do

  context 'public endpoint' do
    before do
      subject = Meliapi.new({
        site: 'MLB',
        auth_url: 'https://auth.mercadolivre.com.br'
      })
    end

    describe '#get_request', :vcr do
      context 'public' do
        it 'success' do
          expect(subject.get_request('sites/MLB')).to include(:ok)
        end
      end
    end
  end

  context 'auth endpoint' do
    subject { 
      Meliapi.new({
        app_key: ENV['APP_KEY'],
        app_secret: ENV['APP_SECRET'],
        callback_url: ENV['CALLBACK_URL'],
        access_token: ENV['ACCESS_TOKEN'],
        site: 'MLB',
        auth_url: 'https://auth.mercadolivre.com.br',
      })
    }

    describe '#get_request', :vcr do
      context 'public' do
        context 'not authorized' do
            subject {
              Meliapi.new({
                app_key: ENV['APP_KEY'],
                app_secret: ENV['APP_SECRET'],
                callback_url: ENV['CALLBACK_URL'],
                access_token: '123',
                site: 'MLB',
                auth_url: 'https://auth.mercadolivre.com.br',
              })
            }

          it do
            expect(subject.get_request('users/me')).to include(:error)            
          end
        end

        it 'success' do
          expect(subject.get_request('users/me')).to include(:ok)          
        end
      end
    end
  end
end
