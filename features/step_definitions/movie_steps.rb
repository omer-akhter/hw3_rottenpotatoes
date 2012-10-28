# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
  assert page.text.match( /#{e1}.*#{e2}/m ) != nil
  assert page.text.match( /#{e2}.*#{e1}/m ) == nil
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |un, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  rating_list.split(%r{,\s*}).each do |rating|
    step "I #{un}check \"ratings_#{rating}\""
  end
end

Then /I should see all of the movies/ do
  step "\"movies\" table should have 11 rows"
end

Then /I should see none of the movies/ do
  step "\"movies\" table should have 1 rows"
end
