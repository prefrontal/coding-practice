#!/usr/bin/env python3

# WWDC 2015 Video Downloader

import re
import urllib.request

# Create the list of WWDC Sessions
sessionList = list();
sessionList.append ("/videos/play/wwdc2015-101/");
sessionList.append ("/videos/play/wwdc2015-102/");
sessionList.append ("/videos/play/wwdc2015-102/");
sessionList.append ("/videos/play/wwdc2015-103/");
sessionList.append ("/videos/play/wwdc2015-104/");
sessionList.append ("/videos/play/wwdc2015-104/");
sessionList.append ("/videos/play/wwdc2015-105/");
sessionList.append ("/videos/play/wwdc2015-105/");
sessionList.append ("/videos/play/wwdc2015-106/");
sessionList.append ("/videos/play/wwdc2015-106/");
sessionList.append ("/videos/play/wwdc2015-107/");
sessionList.append ("/videos/play/wwdc2015-108/");
sessionList.append ("/videos/play/wwdc2015-112/");
sessionList.append ("/videos/play/wwdc2015-112/");
sessionList.append ("/videos/play/wwdc2015-201/");
sessionList.append ("/videos/play/wwdc2015-202/");
sessionList.append ("/videos/play/wwdc2015-203/");
sessionList.append ("/videos/play/wwdc2015-204/");
sessionList.append ("/videos/play/wwdc2015-205/");
sessionList.append ("/videos/play/wwdc2015-206/");
sessionList.append ("/videos/play/wwdc2015-207/");
sessionList.append ("/videos/play/wwdc2015-208/");
sessionList.append ("/videos/play/wwdc2015-209/");
sessionList.append ("/videos/play/wwdc2015-210/");
sessionList.append ("/videos/play/wwdc2015-211/");
sessionList.append ("/videos/play/wwdc2015-212/");
sessionList.append ("/videos/play/wwdc2015-212/");
sessionList.append ("/videos/play/wwdc2015-213/");
sessionList.append ("/videos/play/wwdc2015-214/");
sessionList.append ("/videos/play/wwdc2015-215/");
sessionList.append ("/videos/play/wwdc2015-216/");
sessionList.append ("/videos/play/wwdc2015-217/");
sessionList.append ("/videos/play/wwdc2015-218/");
sessionList.append ("/videos/play/wwdc2015-219/");
sessionList.append ("/videos/play/wwdc2015-220/");
sessionList.append ("/videos/play/wwdc2015-221/");
sessionList.append ("/videos/play/wwdc2015-222/");
sessionList.append ("/videos/play/wwdc2015-223/");
sessionList.append ("/videos/play/wwdc2015-224/");
sessionList.append ("/videos/play/wwdc2015-225/");
sessionList.append ("/videos/play/wwdc2015-226/");
sessionList.append ("/videos/play/wwdc2015-227/");
sessionList.append ("/videos/play/wwdc2015-228/");
sessionList.append ("/videos/play/wwdc2015-229/");
sessionList.append ("/videos/play/wwdc2015-230/");
sessionList.append ("/videos/play/wwdc2015-231/");
sessionList.append ("/videos/play/wwdc2015-232/");
sessionList.append ("/videos/play/wwdc2015-233/");
sessionList.append ("/videos/play/wwdc2015-234/");
sessionList.append ("/videos/play/wwdc2015-301/");
sessionList.append ("/videos/play/wwdc2015-301/");
sessionList.append ("/videos/play/wwdc2015-302/");
sessionList.append ("/videos/play/wwdc2015-303/");
sessionList.append ("/videos/play/wwdc2015-304/");
sessionList.append ("/videos/play/wwdc2015-306/");
sessionList.append ("/videos/play/wwdc2015-401/");
sessionList.append ("/videos/play/wwdc2015-402/");
sessionList.append ("/videos/play/wwdc2015-403/");
sessionList.append ("/videos/play/wwdc2015-404/");
sessionList.append ("/videos/play/wwdc2015-405/");
sessionList.append ("/videos/play/wwdc2015-406/");
sessionList.append ("/videos/play/wwdc2015-407/");
sessionList.append ("/videos/play/wwdc2015-408/");
sessionList.append ("/videos/play/wwdc2015-408/");
sessionList.append ("/videos/play/wwdc2015-409/");
sessionList.append ("/videos/play/wwdc2015-410/");
sessionList.append ("/videos/play/wwdc2015-411/");
sessionList.append ("/videos/play/wwdc2015-412/");
sessionList.append ("/videos/play/wwdc2015-413/");
sessionList.append ("/videos/play/wwdc2015-414/");
sessionList.append ("/videos/play/wwdc2015-501/");
sessionList.append ("/videos/play/wwdc2015-502/");
sessionList.append ("/videos/play/wwdc2015-503/");
sessionList.append ("/videos/play/wwdc2015-504/");
sessionList.append ("/videos/play/wwdc2015-505/");
sessionList.append ("/videos/play/wwdc2015-506/");
sessionList.append ("/videos/play/wwdc2015-507/");
sessionList.append ("/videos/play/wwdc2015-508/");
sessionList.append ("/videos/play/wwdc2015-509/");
sessionList.append ("/videos/play/wwdc2015-510/");
sessionList.append ("/videos/play/wwdc2015-511/");
sessionList.append ("/videos/play/wwdc2015-602/");
sessionList.append ("/videos/play/wwdc2015-603/");
sessionList.append ("/videos/play/wwdc2015-604/");
sessionList.append ("/videos/play/wwdc2015-605/");
sessionList.append ("/videos/play/wwdc2015-606/");
sessionList.append ("/videos/play/wwdc2015-607/");
sessionList.append ("/videos/play/wwdc2015-608/");
sessionList.append ("/videos/play/wwdc2015-609/");
sessionList.append ("/videos/play/wwdc2015-610/");
sessionList.append ("/videos/play/wwdc2015-701/");
sessionList.append ("/videos/play/wwdc2015-702/");
sessionList.append ("/videos/play/wwdc2015-703/");
sessionList.append ("/videos/play/wwdc2015-704/");
sessionList.append ("/videos/play/wwdc2015-705/");
sessionList.append ("/videos/play/wwdc2015-706/");
sessionList.append ("/videos/play/wwdc2015-707/");
sessionList.append ("/videos/play/wwdc2015-708/");
sessionList.append ("/videos/play/wwdc2015-709/");
sessionList.append ("/videos/play/wwdc2015-709/");
sessionList.append ("/videos/play/wwdc2015-710/");
sessionList.append ("/videos/play/wwdc2015-711/");
sessionList.append ("/videos/play/wwdc2015-712/");
sessionList.append ("/videos/play/wwdc2015-713/");
sessionList.append ("/videos/play/wwdc2015-714/");
sessionList.append ("/videos/play/wwdc2015-715/");
sessionList.append ("/videos/play/wwdc2015-717/");
sessionList.append ("/videos/play/wwdc2015-718/");
sessionList.append ("/videos/play/wwdc2015-719/");
sessionList.append ("/videos/play/wwdc2015-720/");
sessionList.append ("/videos/play/wwdc2015-801/");
sessionList.append ("/videos/play/wwdc2015-801/");
sessionList.append ("/videos/play/wwdc2015-802/");
sessionList.append ("/videos/play/wwdc2015-802/");
sessionList.append ("/videos/play/wwdc2015-803/");
sessionList.append ("/videos/play/wwdc2015-804/");
sessionList.append ("/videos/play/wwdc2015-804/");
sessionList.append ("/videos/play/wwdc2015-805/");

for session in sessionList:

    # Get the page source for the video session page
    sessionPage = "https://developer.apple.com" + session;

    page = urllib.request.urlopen(sessionPage)
    pageSource = page.read().decode('utf-8')
    
    # Find the standard definition URL in the page source
    expression = '(http:\/\/devstreaming.apple.com\/videos\/wwdc\/2015\/[^/]*\/\d\d\d/\d\d\d_sd_.*mp4)'
    regexResult = re.search (expression, pageSource)

    # Open the URL of the actual video
    videoUrl = regexResult.group(0);
    print ("Downloading: " + videoUrl)
    video = urllib.request.urlopen (videoUrl)
    
    # Find the filename of the video
    expression = '([^/]*mp4)'
    regexResult = re.search (expression, videoUrl)
    filename = regexResult.group(0)
    
    # Save the video
    filePath = "/Users/prefrontal/Desktop/WWDC-2015/" + filename;
    output = open (filePath, 'wb')
    output.write (video.read())
    output.close()
    
    # For debugging...
    #person = input('-WAIT-')

print ("Downloading complete.")










