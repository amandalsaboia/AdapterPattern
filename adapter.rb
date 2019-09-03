# O Target define a interface específica do dominio usada pelo código do cliente
class Target
  # @return [String]
  def request
    'Target: The default target\'s behavior.'
  end
end

# O Adaptee contém algum comportamento útil, mas sua interface é incompatível
# com o código do cliente existente. O Adaptee precisa de alguma adaptação antes do
# código do cliente poder usá-lo.
class Adaptee
  # @return [String]
  def specific_request
    '.eetpadA eht fo roivaheb laicepS'
  end
end

# O Adapter faz a interface do Adaptee compatível com a interface do Target
class Adapter < Target
  # @param [Adaptee] adaptee
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    "Adapter: (TRANSLATED) #{@adaptee.specific_request.reverse!}"
  end
end

# O client_code suporta todas as classes que seguem a interface Target.
def client_code(target)
  print target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = Target.new
client_code(target)
puts "\n\n"

adaptee = Adaptee.new
puts 'Client: The Adaptee class has a weird interface. See, I don\'t understand it:'
puts "Adaptee: #{adaptee.specific_request}"
puts "\n"

puts 'Client: But I can work with it via the Adapter:'
adapter = Adapter.new(adaptee)
client_code(adapter)