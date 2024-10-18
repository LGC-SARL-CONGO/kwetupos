import React, { useState, useEffect, useContext, useRef } from 'react';

import { MdOutlinePlayCircleOutline } from "react-icons/md";
import { MdOutlinePauseCircleOutline } from "react-icons/md";

import './AudioPlayer.scss';

const AudioPlayer = ({ file, className }) => {
    const [isPlaying, setIsPlaying] = useState(false)
    const [duration, setDuration] = useState(0)
    const [currentTime, setCurrentTime] = useState(0)
    const [progress, setProgress] = useState(0)
    const [url, setUrl] = useState(null)
    const [reproducing, setReproducing] = useState(false)

    const audioPlayer = useRef() 
    const progressBar = useRef()   
    const animationRef = useRef() 

    useEffect(() => {
        setUrl(URL.createObjectURL(file))

        setTimeout(() => {
            const seconds = audioPlayer.current.duration

            setDuration(seconds)
            progressBar.current.max = seconds
        }, 200);
    }, [file])

    useEffect(() => {
        onEnded()
    }, [progressBar?.current?.value])

    const calculateTime = (secs) => {
        const minutes = Math.floor(secs / 60)
        const returnedMinutes = minutes < 10 ? `0${minutes}` : `${minutes}`
        const seconds = Math.floor(secs % 60)
        const returnedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`
        return `${returnedMinutes}:${returnedSeconds}`
    }

    const togglePlayPause = () => {
        setIsPlaying(!isPlaying)
        setReproducing(true)

        if (!isPlaying) {
            audioPlayer.current.play()
            animationRef.current = requestAnimationFrame(whilePlaying)
        } else {
            audioPlayer.current.pause()
            cancelAnimationFrame(animationRef.current)
        }
    }

    const whilePlaying = () => {
        progressBar.current.value = audioPlayer.current.currentTime
        animationRef.current = requestAnimationFrame(whilePlaying)

        changePlayerCurrentTime()
    }

    const changeRange = () => {
        audioPlayer.current.currentTime = progressBar.current.value
        changePlayerCurrentTime()
    }

    const changePlayerCurrentTime = () => {
        setCurrentTime(progressBar.current.value)

        const value = (progressBar.current.value / duration) * 100
        setProgress(value)
    }

    const onEnded = () => {
        if (progress === 100) {
            setIsPlaying(false)
            setCurrentTime(0)
            setProgress(0)
            cancelAnimationFrame(animationRef.current)
            setReproducing(false)
            URL.revokeObjectURL(url)

            audioPlayer.current.currentTime = 0
            audioPlayer.current.pause()
            progressBar.current.value = 0
        }
    }

  return (
    <div className={`audio-player-container`}>
      <div className='d-flex align-items-center gap-1 w-80'>
        <audio ref={audioPlayer} src={url} type={file?.type} preload="metadata" onEnded={onEnded}></audio>

        <div onClick={togglePlayPause} className={`audio-player-container__buttons ${className?.buttons}`}>
          {isPlaying ? <MdOutlinePauseCircleOutline /> : <MdOutlinePlayCircleOutline />}
        </div>

        <div className="d-flex flex-column justify-content-center" style={{position: 'relative'}}>
          <input type="range" className={`audio-player-container__progress ${className.progress}`} defaultValue="0" ref={progressBar} onChange={changeRange} />
          <div className={`audio-player-container__progress-inner ${className?.progressInner}`} style={{ width: `${progress?.toFixed(2)}%` }}></div>
        </div>
      </div>

      <div className='audio-player-container__duration'>
        {reproducing ? <span>{calculateTime(currentTime)}</span> : <span>{(duration && !isNaN(duration)) && calculateTime(duration)}</span>}
      </div>        
    </div>
  );
};

export default AudioPlayer;
