module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mappings do
      indexes :author_name, type: 'text'
      indexes :title, type: 'text'
      indexes :description, type: 'text'
    end

    def self.search(query)
      params = {
        query: {
          multi_match: {
            query: "%#{query}%",
            fields: ['author_name', 'title', 'description'],
            fuzziness: "AUTO"
          }
        }
      }

      self.__elasticsearch__.search(params).records.to_a
    end    
  end
end
