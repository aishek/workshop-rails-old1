class ArticleForm < Reform::Form
  include Reform::Form::ActiveModel::ModelReflections

  property :title
  property :text

  validates :title, presence: true,
                    length: { minimum: 5 }

  LinkPrepopulator = -> (options) {
    if inputs.size == 0
      inputs << Article::Link.new
    end
  }

  LinkPopulator = -> (options) {
    fragment, collection, index = options[:fragment], options[:model], options[:index]

    if fragment["_destroy"] == "1"
      collection.delete_at(index)
      return skip!
    else
      (item = collection[index]) ? item : collection.insert(index, Article::Link.new)
    end
  }

  collection :links, prepopulator: LinkPrepopulator, populator: LinkPopulator do
    property :id,       writeable: false
    property :_destroy, virtual: true
    property :url

    def new_record?
      model.new_record?
    end

    def marked_for_destruction?
      model.marked_for_destruction?
    end
  end
end
