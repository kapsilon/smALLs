# Dowload video from YouTube or other video-hostings with youtube-dl+ffmpeg
Function Dowload-Video-From-YouTube ($link, $format) {
    #Set YouTube-DL
    $ytdlFolder = "C:\Program Files\YouTube-DL\"
    $ytdlExe = "youtube-dl.exe"
    $ytdl = $ytdlFolder + $ytdlExe
    #Set download
    $downloadFolder = "G:\Download\"
    $downloadFile = "%(title)s__%(resolution)s.%(ext)s"
    $dl = $downloadFolder + $downloadFile
 
    $host.UI.RawUI.WindowTitle = "YouTube-DL"
    if ($link -and $format) {
        if ($format -eq "1080") {
            $format = "-f 137+22"
        }
        elseif ($format -eq "subs") {
            $format = "--write-sub --convert-subs srt --sub-lang en,ru --skip-download "
            #Fix for not converting to srt "ffmpeg.exe -i subtitle.vtt subtitles.srt"
        }
        elseif ($format -eq "asubs") {
            $format = "--write-auto-sub --convert-subs srt --sub-lang en,ru --skip-download"
            #Fix for not converting to srt "ffmpeg.exe -i subtitle.vtt subtitles.srt"
        }
        else {
            $format = "-f " + $format
        }
        $arguments = $format + " -o " + $dl + " " + $link
        Start-Process -FilePath $ytdl -ArgumentList $arguments -NoNewWindow -Wait
    }
    elseif ($link) {
        $arguments = "-F " + $link
        Start-Process -FilePath $ytdl -ArgumentList $arguments -NoNewWindow -Wait
    }
    else {
        echo "For view all variants: 'youtube https://yourlink.to/video'"
        echo "For download variant (video+audio): 'youtube https://yourlink.to/video 137+22'"
        echo "For download 1080p+bestaudio: 'youtube https://yourlink.to/video 1080'"
        echo "For download subtitles: 'youtube https://yourlink.to/video subs'"
        echo "For download automated subtitles: 'youtube https://yourlink.to/video asubs'"
    }
    $host.UI.RawUI.WindowTitle = "PowerShell"
}
Set-Alias youtube -Value Dowload-Video-From-YouTube