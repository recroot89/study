module Exercise
  module Arrays
    class << self
      def replace(array)
        max_value = max(array)
        array.map { |x| x.positive? ? max_value : x }
      end

      def search(array, query)
        return -1 if array.empty? || array[array.size - 1] < query || array[0] > query

        iter = lambda do |begin_i, end_i|
          return -1 if begin_i > end_i

          mid_i = begin_i + end_i + 1 / 2
          if array[mid_i] > query
            iter.call(begin_i, mid_i - 1)
          elsif array[mid_i] < query
            iter.call(mid_i + 1, end_i)
          else
            mid_i
          end
        end

        iter.call(0, array.size - 1)
      end

      private

      def max(array)
        head, *tail = array
        iter = lambda do |acc, elements|
          return acc if elements.empty?

          first, *rest = elements
          iter.call(first > acc ? first : acc, rest)
        end

        iter.call(head, tail)
      end
    end
  end
end
