module ApplicationHelper

    def full_title(page_title="")
        base_title = "文系学生と学ぶ社会学"
        if page_title.empty?
            base_title
        else
            page_title + '|' + base_title
        end
    end
end
