module TasksHelper

	  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def github_for(task, options = { size: 50 })
    size = options[:size]
    image_tag('github.gif', :size => "#{size}x#{size}", class: "github")
  end
end
