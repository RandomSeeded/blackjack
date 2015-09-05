assert = chai.assert

describe 'game model', ->
  app = null
  
  beforeEach ->
    app = new App()


  #we can split out the choose winner properly
  # from the generating scores properly
  # all we then have to do for choose winner is give the players scores arrays
  # and then test the generating scores from the cards

  describe 'logic', ->
    it "should choose winner properly", ->
      card1= new Card(rank:9,suit:0)
      card2= new Card(rank:8,suit:0)
      player = new Hand([card1,card2])
      card3= new Card(rank:7,suit:0)
      card4= new Card(rank:7,suit:0)
      dealer = new Hand([card3,card4])
      debugger

      winner = app.findWinner(player,dealer)

      assert.strictEqual winner,player