module ApplicationHelper
  include Pagy::Frontend

  TERM_OPTIONS = {
    '1232' => 'Spring 2023',
    '1234' => 'Summer 2023',
    '1238' => 'Autumn 2023'
    # Add more term mappings as needed
  }.freeze

  def term_options_for_select
    TERM_OPTIONS.map { |number, name| [name, number] }
  end
end
