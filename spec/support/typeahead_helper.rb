def fill_in_autocomplete(selector, value)
  script = %Q{ $('#{selector}').val('#{value}').focus().keypress() }
  page.execute_script(script)
end

def choose_autocomplete(text)
    byebug
  expect(page).to have_css(".tt-suggestion div", text: text, visible: false)
  script = %Q{ $('.tt-suggestion:contains("#{text}")').click() }
  page.execute_script(script)
end
