class PageController < ApplicationController

def welcome
  @issues = Issue.all.reverse.take(10)
end

end