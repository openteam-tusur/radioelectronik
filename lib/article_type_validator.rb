class ArticleTypeValidator < ActiveModel::Validator
  def validate(record)
    if record.issue.articles.pluck(:article_type).include?("issue_theme")  && record.article_type  == "issue_theme"
      record.errors[:article_type] << "Тема номера уже существует, выберите другой тип новости"
    end
  end
end

