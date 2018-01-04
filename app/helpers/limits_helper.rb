module LimitsHelper

  def content(limit)

    case limit.status
    when 0
      "不能发表文章"
    when 1
      "不能评论"
    when 2
        "全部"
    end
  end
end
