#!/usr/bin/env python3

# WWDC 2014 Video Downloader

import re
import urllib.request

# Create the list of WWDC Sessions
sessionList = list();
sessionList.append ("/videos/play/wwdc2014-101/");
sessionList.append ("/videos/play/wwdc2014-102/");
sessionList.append ("/videos/play/wwdc2014-103/");
sessionList.append ("/videos/play/wwdc2014-201/");
sessionList.append ("/videos/play/wwdc2014-202/");
sessionList.append ("/videos/play/wwdc2014-203/");
sessionList.append ("/videos/play/wwdc2014-204/");
sessionList.append ("/videos/play/wwdc2014-205/");
sessionList.append ("/videos/play/wwdc2014-206/");
sessionList.append ("/videos/play/wwdc2014-207/");
sessionList.append ("/videos/play/wwdc2014-208/");
sessionList.append ("/videos/play/wwdc2014-209/");
sessionList.append ("/videos/play/wwdc2014-210/");
sessionList.append ("/videos/play/wwdc2014-211/");
sessionList.append ("/videos/play/wwdc2014-212/");
sessionList.append ("/videos/play/wwdc2014-213/");
sessionList.append ("/videos/play/wwdc2014-214/");
sessionList.append ("/videos/play/wwdc2014-216/");
sessionList.append ("/videos/play/wwdc2014-217/");
sessionList.append ("/videos/play/wwdc2014-218/");
sessionList.append ("/videos/play/wwdc2014-219/");
sessionList.append ("/videos/play/wwdc2014-220/");
sessionList.append ("/videos/play/wwdc2014-221/");
sessionList.append ("/videos/play/wwdc2014-222/");
sessionList.append ("/videos/play/wwdc2014-223/");
sessionList.append ("/videos/play/wwdc2014-224/");
sessionList.append ("/videos/play/wwdc2014-225/");
sessionList.append ("/videos/play/wwdc2014-226/");
sessionList.append ("/videos/play/wwdc2014-227/");
sessionList.append ("/videos/play/wwdc2014-228/");
sessionList.append ("/videos/play/wwdc2014-229/");
sessionList.append ("/videos/play/wwdc2014-230/");
sessionList.append ("/videos/play/wwdc2014-231/");
sessionList.append ("/videos/play/wwdc2014-232/");
sessionList.append ("/videos/play/wwdc2014-233/");
sessionList.append ("/videos/play/wwdc2014-234/");
sessionList.append ("/videos/play/wwdc2014-235/");
sessionList.append ("/videos/play/wwdc2014-236/");
sessionList.append ("/videos/play/wwdc2014-237/");
sessionList.append ("/videos/play/wwdc2014-301/");
sessionList.append ("/videos/play/wwdc2014-302/");
sessionList.append ("/videos/play/wwdc2014-303/");
sessionList.append ("/videos/play/wwdc2014-304/");
sessionList.append ("/videos/play/wwdc2014-305/");
sessionList.append ("/videos/play/wwdc2014-306/");
sessionList.append ("/videos/play/wwdc2014-401/");
sessionList.append ("/videos/play/wwdc2014-402/");
sessionList.append ("/videos/play/wwdc2014-403/");
sessionList.append ("/videos/play/wwdc2014-404/");
sessionList.append ("/videos/play/wwdc2014-406/");
sessionList.append ("/videos/play/wwdc2014-407/");
sessionList.append ("/videos/play/wwdc2014-408/");
sessionList.append ("/videos/play/wwdc2014-409/");
sessionList.append ("/videos/play/wwdc2014-410/");
sessionList.append ("/videos/play/wwdc2014-411/");
sessionList.append ("/videos/play/wwdc2014-412/");
sessionList.append ("/videos/play/wwdc2014-413/");
sessionList.append ("/videos/play/wwdc2014-414/");
sessionList.append ("/videos/play/wwdc2014-415/");
sessionList.append ("/videos/play/wwdc2014-416/");
sessionList.append ("/videos/play/wwdc2014-417/");
sessionList.append ("/videos/play/wwdc2014-418/");
sessionList.append ("/videos/play/wwdc2014-419/");
sessionList.append ("/videos/play/wwdc2014-501/");
sessionList.append ("/videos/play/wwdc2014-502/");
sessionList.append ("/videos/play/wwdc2014-503/");
sessionList.append ("/videos/play/wwdc2014-504/");
sessionList.append ("/videos/play/wwdc2014-505/");
sessionList.append ("/videos/play/wwdc2014-506/");
sessionList.append ("/videos/play/wwdc2014-508/");
sessionList.append ("/videos/play/wwdc2014-509/");
sessionList.append ("/videos/play/wwdc2014-510/");
sessionList.append ("/videos/play/wwdc2014-511/");
sessionList.append ("/videos/play/wwdc2014-512/");
sessionList.append ("/videos/play/wwdc2014-513/");
sessionList.append ("/videos/play/wwdc2014-514/");
sessionList.append ("/videos/play/wwdc2014-515/");
sessionList.append ("/videos/play/wwdc2014-516/");
sessionList.append ("/videos/play/wwdc2014-517/");
sessionList.append ("/videos/play/wwdc2014-601/");
sessionList.append ("/videos/play/wwdc2014-602/");
sessionList.append ("/videos/play/wwdc2014-603/");
sessionList.append ("/videos/play/wwdc2014-604/");
sessionList.append ("/videos/play/wwdc2014-605/");
sessionList.append ("/videos/play/wwdc2014-606/");
sessionList.append ("/videos/play/wwdc2014-608/");
sessionList.append ("/videos/play/wwdc2014-609/");
sessionList.append ("/videos/play/wwdc2014-610/");
sessionList.append ("/videos/play/wwdc2014-611/");
sessionList.append ("/videos/play/wwdc2014-612/");
sessionList.append ("/videos/play/wwdc2014-701/");
sessionList.append ("/videos/play/wwdc2014-702/");
sessionList.append ("/videos/play/wwdc2014-703/");
sessionList.append ("/videos/play/wwdc2014-704/");
sessionList.append ("/videos/play/wwdc2014-705/");
sessionList.append ("/videos/play/wwdc2014-706/");
sessionList.append ("/videos/play/wwdc2014-707/");
sessionList.append ("/videos/play/wwdc2014-708/");
sessionList.append ("/videos/play/wwdc2014-709/");
sessionList.append ("/videos/play/wwdc2014-710/");
sessionList.append ("/videos/play/wwdc2014-711/");
sessionList.append ("/videos/play/wwdc2014-712/");
sessionList.append ("/videos/play/wwdc2014-713/");
sessionList.append ("/videos/play/wwdc2014-714/");
sessionList.append ("/videos/play/wwdc2014-715/");
sessionList.append ("/videos/play/wwdc2014-716/");
sessionList.append ("/videos/play/wwdc2014-717/");
sessionList.append ("/videos/play/wwdc2014-718/");

for session in sessionList:

    # Get the page source for the video session page
    sessionPage = "https://developer.apple.com" + session;

    page = urllib.request.urlopen(sessionPage)
    pageSource = page.read().decode('utf-8')

    # Find the standard definition URL in the page source
    # Of the format: http://devstreaming.apple.com/videos/wwdc/2014/718xxctf8ley20j/718/718_sd_adopting_airprint.mov
    expression = '(http:\/\/devstreaming.apple.com\/videos\/wwdc\/2014\/[^/]*\/\d\d\d\/\d\d\d_sd.*mov)'
    regexResult = re.search (expression, pageSource)
	
    # Open the URL of the actual video
    videoUrl = regexResult.group(0);
    print ("Downloading: " + videoUrl)
    video = urllib.request.urlopen (videoUrl)
    
    # Find the filename of the video
    expression = '([^/]*mov)'
    regexResult = re.search (expression, videoUrl)
    filename = regexResult.group(0)
    
    # Save the video
    filePath = "/Users/prefrontal/Desktop/WWDC-2014/" + filename;
    output = open (filePath, 'wb')
    output.write (video.read())
    output.close()
    
    # For debugging...
    # person = input('-WAIT-')

print ("Downloading complete.")










