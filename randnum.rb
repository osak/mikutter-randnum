# coding: utf-8

Plugin.create :randnum do
  DIGITS = ("0".."9").to_a

  filter_gui_postbox_post do |gui_postbox|
    buf = Plugin.create(:gtk).widgetof(gui_postbox).widget_post.buffer
    text = buf.text

    randnum = Array.new(10+(rand*10).to_i){DIGITS.sample}
    if randnum[0] == "0"
      randnum[0] = DIGITS[1..9].sample
    end
    text.gsub!(/%rand%/, randnum.join)

    buf.text = text

    [gui_postbox]
  end
end
