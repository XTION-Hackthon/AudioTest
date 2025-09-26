//
//  AudioController.swift
//  AudioTest
//
//  Created by Andy Lyu on 9/26/25.
//

import Foundation
import CoreAudio

func setSystemVolume(_ volume: Float32) {
    var deviceID = AudioDeviceID(0)
    var dataSize = UInt32(MemoryLayout<AudioDeviceID>.size)
    var addr = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDefaultOutputDevice,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: kAudioObjectPropertyElementMain
    )

    let status = AudioObjectGetPropertyData(
        AudioObjectID(kAudioObjectSystemObject),
        &addr,
        0,
        nil,
        &dataSize,
        &deviceID
    )
    
    if status != noErr {
        print("获取设备失败，错误码 \(status)")
        return
    }
    
    var vol = volume
    addr = AudioObjectPropertyAddress(
        mSelector: kAudioDevicePropertyVolumeScalar,
        mScope: kAudioDevicePropertyScopeOutput,
        mElement: kAudioObjectPropertyElementMain
    )

    let setStatus = AudioObjectSetPropertyData(
        deviceID,
        &addr,
        0,
        nil,
        UInt32(MemoryLayout<Float32>.size),
        &vol
    )

    if setStatus != noErr {
        print("设置音量失败，错误码 \(setStatus)")
    }
}
