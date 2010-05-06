require File.dirname(__FILE__) + '/test_helper.rb'
require File.dirname(__FILE__) + '/../lib/natural_sort.rb'

class MyClass
  include NaturalSort
  
  def initialize(array = Base)
    @array = array
  end
  
  def to_a
    @array
  end
end

# Test without include
class TestNaturalSortSelf < Test::Unit::TestCase
  def test_self
    assert_equal NaturalSort::BaseSorted, NaturalSort::naturalsort(NaturalSort::Base)
  end
end

# Test using include
class TestNaturalSort < Test::Unit::TestCase
  include NaturalSort
  
  def setup
    @obj = MyClass.new
  end
  
  def test_case_sensitive
    sorted = @obj.natural_sort
    assert_equal BaseSorted, sorted
  end
  
  def test_mixed
    obj = MyClass.new ['a1', 'a12', 'A11', 'a2', 'a10', 'A3', 'a21', 'A29']
    assert_equal ['a1', 'a2', 'A3', 'a10', 'A11', 'a12', 'a21', 'A29'], obj.natural_sort
  end
  
  def test_numbers
    obj = MyClass.new ['a1', 'a12', 'a11', 'a2', 'a10', 'a3', 'a21', 'a29']
    assert_equal ['a1', 'a2', 'a3', 'a10', 'a11', 'a12', 'a21', 'a29'], obj.natural_sort
  end
end
