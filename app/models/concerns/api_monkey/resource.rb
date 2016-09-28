module ApiMonkey
  module Resource
    extend ActiveSupport::Concern

    included do
      def self.except_fields
        @except_fields ||= %i(id created_at updated_at)
      end

      def self.accept_fields
        @accept_fields ||= columns.map(&:name).select {|f| !except_fields.include?(f.to_sym) }.map(&:to_sym)
      end

      def self.api_accept(opt={})
        @accept_fields = opt[:only]
        @except_fields = opt[:except]
      end
    end
  end
end
