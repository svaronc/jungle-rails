require 'rails_helper'

describe "#id" do
      it "behaves like" do
        @widget = Widget.new
        expect(@widget.id).to be_nil  
    end
      it 'should be auto-assigned by AR for saved records' do
        @widget = Widget.new
        @widget.save!
        expect(@widget.id).to be_present 
    end
  end

