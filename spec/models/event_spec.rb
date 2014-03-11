require 'spec_helper'

describe Event do

	describe 'name' do
	  it 'should not be blank' do
	  	event = Event.new name: nil
	  	expect(event).to have(1).error_on(:name)
	  end

	  it 'should not have error when present' do
	  	event = Event.new name: "hi"
	  	expect(event).not_to have(1).error_on(:name)
	  end

	  it 'should not to be less than 60 characters' do
	    event = Event.new name: "a"*61
	    expect(event).to have(1).error_on(:name)
	  end

	  it 'should not have error when present' do
	  	event = Event.new name: "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
	  	expect(event).not_to have(1).error_on(:name)
	  end
	end

	describe 'description' do

	  it 'is valid when blank' do
		event = Event.new description: ""
	  	expect(event).not_to have(1).error_on(:description)
	  end

	  it 'is not valid when is less 100 characters' do 
	    event = Event.new description: "a"*99
	    expect(event).to have(1).error_on(:description)
	  end

	  it 'should have maximum 100 characters' do 
	    event = Event.new description: "a"*101
	    expect(event).not_to have(1).error_on(:description)
	  end
	end

	describe 'date' do 

	  it 'is valid when the start date is after the end date' do
	   event = Event.new(start_at: Date.today, end_at: Date.today - 1.days)
	   expect(event).to have(1).error_on(:start_at)
	  end

	  it 'is invalid when is blank' do
	  	event = Event.new start_at: nil
	  	expect(event).to have(1).error_on(:start_at)
	  end
	end

	describe 'todays events' do
	  it 'can show today event' do
	  	event = FactoryGirl.create(:event, start_at: Date.today)
	  	expect(Event.start_at_today).to include(event)
	  end

	  it 'does not return yesterday events' do
	    event = FactoryGirl.create(:event, start_at: Date.today - 1.days)
	    expect(Event.start_at_today).not_to include(event)
	    #expect(Event.start_at_today).to be_empty
	    #expect(Event.start_at_today).to eq([])
	    #expect(Event.start_at_today).not_to exist
	    #expect(Event.start_at_today).to be_zero
	  end

	  it 'does not return tomorrow events' do
	  	event = FactoryGirl.create(:event, start_at: Date.today + 1.days)
	  	expect(Event.start_at_today).not_to include(event)
	  end
	end

	describe 'next events' do
	 it 'can show tomorrow events' do
	   event = FactoryGirl.create(:event, start_at: Date.today + 1.days)
	   expect(Event.next_events).to include(event)
	 end

	 it 'can not show today events' do
	 	event = FactoryGirl.create(:event, start_at: Date.today)
	 	expect(Event.next_events).not_to include(event)
	 end

	 it 'can not show previous events' do
	 	event = FactoryGirl.create(:event, start_at: Date.today - 1.days)
	 	expect(Event.next_events).not_to include(event)
	 end
	end

	describe 'next events in Madrid'
	  it 'can not show different locations' do
	    event = FactoryGirl.create(:event, address: 'Madrid' )
	    expect(Event.next_events.location).not_to include(event)
	  end
	end

end
