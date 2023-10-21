{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core
import Euterpea

playNote :: Pitch -> IO ()
playNote p = play $ note qn p

getPlayNoteR :: Pitch -> Handler Html
getPlayNoteR p = liftIO (playNote p) >> return [shamlet|Note played|]

getHomeR = defaultLayout $ do 
    addStylesheet $ StaticR styles_css
    [whamlet|
        By: Marina Seheon, Jack Vanlyssel, and Joesph Barrela
        <div class="greeting">
            Hello, welcome to our Piano Music Generator!
        <div .piano>
            <button .white-key onclick="playNote('C3')">
            <button .black-key onclick="playNote('Cs3')">
            <button .white-key onclick="playNote('D3')">
            <button .black-key onclick="playNote('Ds3')">
            <button .white-key onclick="playNote('E3')">
            <button .white-key onclick="playNote('F3')">
            <button .black-key onclick="playNote('Fs3')">
            <button .white-key onclick="playNote('G3')">
            <button .black-key onclick="playNote('Gs3')">
            <button .white-key onclick="playNote('A3')">
            <button .black-key onclick="playNote('As3')">
            <button .white-key onclick="playNote('B3')">
            <button .white-key onclick="playNote('C4')">
            <button .black-key onclick="playNote('Cs4')">
            <button .white-key onclick="playNote('D4')">
            <button .black-key onclick="playNote('Ds4')">
            <button .white-key onclick="playNote('E4')">
            <button .white-key onclick="playNote('F4')">
            <button .black-key onclick="playNote('Fs4')">
            <button .white-key onclick="playNote('G4')">
            <button .black-key onclick="playNote('Gs4')">
            <button .white-key onclick="playNote('A4')">
            <button .black-key onclick="playNote('As4')">
            <button .white-key onclick="playNote('B4')">
            <button .white-key onclick="playNote('C5')">
            <button .black-key onclick="playNote('Cs5')">
            <button .white-key onclick="playNote('D5')">
            <button .black-key onclick="playNote('Ds5')">
            <button .white-key onclick="playNote('E5')">
            <button .white-key onclick="playNote('F5')">
            <button .black-key onclick="playNote('Fs5')">
            <button .white-key onclick="playNote('G5')">
            <button .black-key onclick="playNote('Gs5')">
            <button .white-key onclick="playNote('A5')">
            <button .black-key onclick="playNote('As5')">
            <button .white-key onclick="playNote('B5')">
        <div .music-settings>
            <form>
                <label for="timeSignature">Time Signature:
                <select id="timeSignature" name="timeSignature">
                    <option value="4/4">4/4
                    <option value="3/4">3/4
                    <option value="2/4">2/4
                    <option value="6/8">6/8
                <label for="bpm">BPM:
                <input type="number" id="bpm" name="bpm" value="120">
                <label for="keySignature">Key Signature:
                <select id="keySignature" name="keySignature">
                    <option value="C">C
                    <option value="G">G
                    <option value="D">D
                    <option value="A">A
                    <option value="E">E
                    <option value="B">B
                    <option value="F#">F#
                    <option value="C#">C#
                    <option value="F">F
                    <option value="Bb">Bb
                    <option value="Eb">Eb
                    <option value="Ab">Ab
                    <option value="Db">Db
                    <option value="Gb">Gb
                    <option value="Cb">Cb
                <button type="submit">Apply
        <script>
            function playNote(note) {
                fetch(`/playNote/${note}`);
            }
    |]