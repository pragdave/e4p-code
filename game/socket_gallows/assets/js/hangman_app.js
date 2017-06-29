const RESPONSES = {
    won:          [ "success", "You Won!" ],
    lost:         [ "danger",  "You Lost!" ],
    good_guess:   [ "success", "Good guess!" ],
    bad_guess:    [ "warning", "Bad guess!" ],
    already_used: [ "info",    "You already guessed that" ],
    initializing: [ "info",    "Let's Play!" ]
}

import HangmanSocket from "./hangman_socket"

let view = function(hangman) {
    let app = new Vue({
        el: "#app",
        data: {
            tally: hangman.tally
        },
        computed: {
            game_over: function() {
                let state = this.tally.game_state
                return (state == "won") || (state == "lost")
            },
            game_state_message: function() {
                let state = this.tally.game_state
                return RESPONSES[state][1]
            },
            game_state_class: function() {
                let state = this.tally.game_state
                return RESPONSES[state][0]
            }
        },
        methods: {
            guess: function(ch) {
                hangman.make_move(ch)
            },
            new_game: function() {
                hangman.new_game()
            },
            already_guessed: function(ch) {
                return this.tally.used.indexOf(ch) >= 0
            },
            correct_guess: function(ch) {
                return this.already_guessed(ch) &&
                       (this.tally.letters.indexOf(ch) >= 0)
            },
            turns_gt: function(left) {
                return this.tally.turns_left > left
            }
        }
    })
    return app;
}

window.onload = function() {
    let tally = {
        turns_left: 7,
        letters:    ["a", "_", "c" ],
        game_state: "initializing",
        used:       [ ]
    }
    let hangman = new HangmanSocket(tally)
    let app     = view(hangman)
    
    hangman.connect_to_hangman()
    
}
