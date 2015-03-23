class PageController < ApplicationController

     def welcome
       @issues = Issue.all
     end

end