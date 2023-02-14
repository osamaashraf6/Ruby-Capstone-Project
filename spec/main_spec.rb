require '../main'

describe 'main' do
  before :each do
    @main_menu = MainMenu.new
  end
  it 'Returns welcome message' do
    expect { @main_menu.show_options }.to output(/Welcome to Catalog of my things/).to_stdout
  end

  # it 'Returns choose option message' do
  #  expect { @main_menu.choose_valid_option }.to output(/Please choose an option by entering the number/).to_stdout
  # end

  it 'Exits with code 0' do
    expect { @main_menu.exit_app }.to output.to_stderr
  end
end
