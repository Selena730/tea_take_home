class CustomerSerializer
    include JSONAPI::Serializer
    attributes :first_name, :last_name, :email, :address
  
    attribute :subscriptions do |object|
        object.subscriptions.map do |subscription|
            SubscriptionSerializer.new(subscription).serializable_hash
        end
    end
end 