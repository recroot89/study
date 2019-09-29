module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |x| x.positive? ? max : x }
      end

      def search(array, query)
        query_index = array.find_index(query)
        query_index.nil? ? -1 : query_index
      end
    end
  end
end
