import {Socket} from "phoenix"

export default class HangmanSocket {
    constructor(tally) {
        this.tally  = tally
        this.socket = new Socket("/socket", { })
        this.socket.connect()
    }

    connect_to_hangman() {
        this.setup_channel();
        this.channel
            .join()
            .receive("ok", resp => {
                console.log("Joined successfully", resp)
                this.fetch_tally()
            })
            .receive("error", resp => {
                alert("Unable to join", resp)
                throw(resp)
            })
    }

    setup_channel() {
        this.channel = this.socket.channel("hangman:game", {})
        this.channel.on("tally", (tally) => {
            this.copy_tally(tally)
        })
    }

    fetch_tally() {
        this.channel.push("tally", {})
    }

    make_move(guess) {
        this.channel.push("make_move", guess)
    }

    new_game() {
        this.channel.push("new_game", {})
    }
    
    copy_tally(from) {
        for (let k in from) {
            this.tally[k] = from[k]
        }
    }
}

