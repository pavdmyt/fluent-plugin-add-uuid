# coding: utf-8
require 'helper'

class AddUuidFilterTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::FilterTestDriver.new(Fluent::AddUuidFilter, tag).configure(conf)
  end

  def test_configure
    #### set configurations
    d = create_driver %[
      key _hello
    ]
    #### check configurations
    assert_equal '_hello', d.instance.key
  end


  def test_uuid
    d = create_driver(%[
      key @uuid
    ])
    d.run do
      d.emit({"id"=>1, "message"=>"hello"})
      d.emit({"id"=>1, "message"=>"hello"})
    end

    # ### FileOutput#write returns path
    filtered = d.filtered_as_array
    assert_equal filtered[0][2]['id'], filtered[1][2]['id']
    assert_not_equal filtered[0][2]['@uuid'], filtered[1][2]['@uuid']
  end

end
