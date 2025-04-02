require "test_helper"

class GatoTest < ActiveSupport::TestCase
  test "should not save gato without required fields" do
    gato = Gato.new
    assert_not gato.save, "Saved the gato without required fields"
  end

  test "should save valid gato" do
    # Create a valid user for association
    user = users(:one)
    
    # Create a valid gato
    gato = Gato.new(
      name: "Whiskers",
      breed: "Siamese",
      description: "A beautiful cat",
      user: user
    )
    
    assert gato.save, "Could not save valid gato"
  end
  
  test "should validate presence of name" do
    user = users(:one)
    gato = Gato.new(
      breed: "Siamese",
      description: "A beautiful cat",
      user: user
    )
    
    assert_not gato.valid?
    assert_includes gato.errors[:name], "can't be blank"
  end
  
  test "should validate presence of breed" do
    user = users(:one)
    gato = Gato.new(
      name: "Whiskers",
      description: "A beautiful cat",
      user: user
    )
    
    assert_not gato.valid?
    assert_includes gato.errors[:breed], "can't be blank"
  end
  
  test "should validate presence of description" do
    user = users(:one)
    gato = Gato.new(
      name: "Whiskers",
      breed: "Siamese",
      user: user
    )
    
    assert_not gato.valid?
    assert_includes gato.errors[:description], "can't be blank"
  end
end
