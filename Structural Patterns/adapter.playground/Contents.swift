import UIKit

enum MediaType{
    case mp4
    case mp3
    case acc
    case mov
    case wav
}

// Target protocol 1
protocol Player {
    //Generics - Sorta
    // How to keep protocols more flexible
    associatedtype Media
    func play(mediaType: Media, fileName: String)
}

// Target protocol 2
protocol Pause{
    //TODO: Implement a Pause protocol with a pause() function that accepts 1 parameter: A String called "fileName"
    func pause(fileName: String)
}


// Adaptee 1
class AudioPlayer {
    func playAudio(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adaptee 2
class VideoPlayer {
    func playVideo(fileName: String) {
        print("Now Playing: ", fileName)
    }
}

// Adapter (class)
class MyPlayer: Player {

    //TODO: create required player variables
    var videoPlayer: VideoPlayer = VideoPlayer()
    var audioPlayer: AudioPlayer = AudioPlayer()

    func play(mediaType: MediaType, fileName: String) {
        if (mediaType == .mov){
            videoPlayer.playVideo(fileName: fileName);
        }else if(mediaType == .mp4){
            audioPlayer.playAudio(fileName: fileName);
        }
    }
}

// Adapter (class extension)
extension MyPlayer: Pause{
    //TODO: Implement a class extension which adds Pause functionality to MyPlayer
    func pause(fileName: String) {
        print(fileName, " is now paused...")
    }
}


// Usage
let myPlayer = MyPlayer()
myPlayer.play(mediaType: .mov, fileName: "Titanium.mov")
myPlayer.play(mediaType: .mp4, fileName: "Cat_riding_a_roomba.mp4")
myPlayer.pause(fileName: "Cat_riding_a_roomba.mp4")


/* This should print:
 Now Playing:  Titanium.aac
 Now Playing:  Cat_riding_a_roomba.mp4
 Cat_riding_a_roomba.mp4  is now paused...
 */
