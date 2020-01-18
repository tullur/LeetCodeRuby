# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
#
#class NestedInteger
#    def is_integer()
#        """
#        Return true if this NestedInteger holds a single integer, rather than a nested list.
#        @return {Boolean}
#        """
#
#    def get_integer()
#        """
#        Return the single integer that this NestedInteger holds, if it holds a single integer
#        Return nil if this NestedInteger holds a nested list
#        @return {Integer}
#        """
#
#    def get_list()
#        """
#        Return the nested list that this NestedInteger holds, if it holds a nested list
#        Return nil if this NestedInteger holds a single integer
#        @return {NestedInteger[]}
#        """

class NestedIterator
  # @param {NestedInteger[]} nested_list
  def initialize(nested_list)
    @list = process(nested_list)
    @index = 0
  end

  def process(nested_list)
    nested_list.map { |list| list.is_integer ? list.get_integer : process(list.get_list) }.flatten
  end

  # @return {Boolean}
  def has_next
    @list && @list.length > 0 && !!@list[@index]
  end

  # @return {Integer}
  def next
    tmp = @list[@index]
    @index += 1
    tmp
  end
end

# Your NestedIterator will be called like this:
# i, v = NestedIterator.new(nested_list), []
# while i.has_next()
#    v << i.next
# end