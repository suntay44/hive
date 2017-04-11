require 'csv'

namespace :import do
  desc "Imports users from csv"
  task users: :environment do
    CSV.foreach("path/to/file.csv")
  end
end