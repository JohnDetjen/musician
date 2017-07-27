//
//  SupportTableViewController.swift
//  Musician
//
//  Created by John Detjen on 6/25/17.
//  Copyright © 2017 FinleyKnight, Inc. All rights reserved.
//

import UIKit
import MessageUI

class SupportTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Gilroy-Light", size: 18)!]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !UserDefaults.standard.bool(forKey: "purchased") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                if let buyVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicianBookingPlus") as? MusicianBookingPlusViewController {
                    buyVC.delegate = self
                    self.present(buyVC, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Book Your Band So You'll Sell Out Every Show")
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br></br>Be Bigger Than the Venue.</br></br>Part of being a DIY musician is about managing impressions. No matter how much you want to play at the hippest venue or be on a big stage, playing to half-empty clubs is bad for business. Instead, book yourself in a venue that is too small for you and your fans. Whether you’ve brought out 300 people to a 600-seat theater or sold 5,000 tickets in a 10,000-capacity arena, those vacant chairs are going to weigh on you and your audience. You’ll feel like crap and wonder why you’re not more popular, and your fans will feel bad for you too. But you don’t want their pity. You want their enthusiasm and cheers. Think smaller.</br></br>A concert promoter or talent buyer is not going to pat you on the back for bringing in enough fans to fill a venue halfway. They’re only going to see those empty seats. The dead dance floor. The vacant bar. The missed opportunities. The wasted money.</br></br> But conversely, “SOLD OUT” has a certain ring to it, doesn’t it? And even if you’ve only “sold out” a coffee shop that holds 30 people, the venue will want to have you back! And more importantly, word will spread to other bookers, bands, music fans, and media that you “packed the place out.” Sure, there were only 30 people there. But a tiny room that’s full of fans can sometimes seem more impressive than a big room that isn’t.</br></br>Be realistic about your estimated draw. Don’t get lost in delusions of grandeur. Then approach the venues that will accommodate just UNDER that number. Yes, I know it sounds counterintuitive when you want to build a fan base and make money. While you shouldn’t adopt this strategy in every case, when you’re first starting out, some well-placed “sold-out” shows can go a long way.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 1 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Transition from Open Mics to Longer Gigs")
                mail.setMessageBody("An open mic is a great place to begin for 3 types of players:</br></br>* Musicians who are new to songwriting and don’t yet have enough strong original material for a 45 minute set.</br></br>* Musicians who may have songwriting and instrumental skills, but who feel they lack performance skills, confidence, etc.</br></br>* Confident songwriters/performers who are new to a town or region and don’t yet have a local fanbase.</br></br>But what’s the next step once you’re ready? Well– your own show, of course– a nice cushiony 30-45 set of original material, maybe opening for someone else in town who has an established draw. And how do you get there?</br></br>1. Play weekly at the open mics-</br>Whether you’re building your repertoire, building an audience, or building up your confidence, get out there as much as possible. Open mic audiences tend to be respectful and receptive, so this is one of the best ways to get live experience in a low-pressure setting. Plus, keeping it weekly will help you stay motivated on all the other fronts (songwriting, practicing, etc.)</br></br>2. Build your email list from the beginning-</br>It’s never too early to start gathering contact info for the people who enjoy your music. Even if you don’t have any recorded music, merch, or gigs to announce (besides your open mics, of course)– you will someday! And when you’ve got big news to share, you’ll have an audience for that news. Don’t be pushy about collecting contacts; simply mention that you have a signup list and that you’d love to keep people notified about your music.</br></br>3. Announce your name at the beginning and end of your open mic set-</br>It’s sometimes hard to get into the promotion mindset at an open mic. They can seem rather informal and low on the drama-scale. But a quick “Hey, my name is____ …..” and a concluding “Thanks, my name is ______ and I appreciate you listening; I have a mailing list….” at the end of your short set will help you, literally, get your name out there.</br></br>I’ve been to quite a few open mics where I’ve liked a performer and said to whoever I was sitting with, “What’s this guy’s name?” They didn’t seem to know either, and we dropped it there– since the evening and the drinks and the conversation and the distractions have a tendency to tumble onwards. So, announce your name! People might not have the time, courage, or wherewithal to ask.</br></br>4. Stay for the whole open mic and make friends-</br>Your early shows will be attended by mostly friends. An open mic is one great place to make those friends. So don’t just pop into the open mic for your 15 minutes of glory and then duck out. Stay and get to know people. Trade info. See if any other talented folks might want to play in your band down the line (if you’re interested in fleshing out your songs with band arrangements). At the very least, get to know each other’s songs and styles. If you come back every week, you could be singing harmonies on one another’s tunes.</br>As you get to know more musicians, you’re also spreading your networking roots. Some of the people you befriend may have bands that you can open for; they may know booking agents; they may sign your mailing list too– and they may be your biggest early supporters.</br></br>5. Get to know the staff at the venue-</br>Most open mics are held at music venues. If you befriend the bar staff, the booker, the manager, the owner, and the patrons, it’s a short jump from a Sunday night open mic to a Thursday opening slot. If you’ve proven to be one of the popular performers week after week at an open mic, the booker will probably already be on your side. But don’t assume they’ll reach out to you first; booking agents have a hundred things on their minds at once. Make sure YOU ask THEM for the gig (once you feel ready)!</br></br>6. Balance your 3-song set-</br>People love familiar songs. When you first start performing at open mics, stick to your best 3 songs. Even if you’re sick of them, repeat them for the first 2 or 3 times you play at a particular open mic. Then slowly work in newer material by playing 2 of the now familiar favorites, and one new one. Then the next week, play one of the oldest tunes, the newer one from the previous week, and one brand new tune. From there, you can keep churning up the dirt how you like, but return to the tunes enough so that the regulars can get to know them. When you finally bring all those folks out to your first proper show, they may just sing along to a few songs.</br></br>7. Morph an open mic into a songwriters-in-the-round-</br>Instead of putting ALL the pressure on yourself for that big leap from open mic to proper gig, why not round up 2 more songwriters you’ve met and do a songwriters-in-the-round set? That’s where 3 or more performers trade off on tunes. You can either rotate after every song, or give each person 2 or 3 tunes before you rotate to the next singer. Instead of one person’s draw, you’re potentially combining all three performers’ followings for one awesome night. That’ll please the booker AND give you the chance to win over some of the other writers’ fans.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 2 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Filling an Out-of-Town Music Club with Fans")
                mail.setMessageBody("Many musicians who draw decent hometown crowds feel a little bit stuck when it comes to touring; they don’t know how to make that leap into a wider world where,… well,… no one’s heard of their band.</br></br>1. Forge relationships with bands in other cities- Opening for established acts in other towns is the best way to build your out-of-town draw.  Befriend them on Facebook. Follow them on Twitter. Repost their content. Once you’ve become chummy (and I don’t mean the ground up bait-fish, although some people might feel that way about networking) with other bands, it’s time to write them and see if you can swap gigs; you open for them in their town– they open for you in your town. For more information on gig-swapping, see our article “Touring: Friends, Favors, and Fun.”</br></br>2. Look for the smaller, quality venues- Bands that can consistently draw 300 people in their hometown are lucky if they can draw 30 people in a different market. You may be a hometown hero, but check your ego at the city limits. While you’re not entitled to play at the best club in every town, you shouldn’t have to play the crap-dive with the busted 80’s Peavy PA either. Most bigger music towns have small, intimate clubs that host quality music and treat bands professionally. Try to book yourself in those clubs. An added bonus to smaller rooms is that when you DO bring out 30-50 people, the room looks PACKED! And a tiny club that is sold out will seem way cooler than a deserted mid-sizer. For more info on this approach, check out our article “Touring Tip: How to Book Your Band So You’ll Sell Out Every Show.”</br></br>3. Advertise your show on Facebook- Facebook ads are cheap and effective if done correctly. Target these ads for people who live in or near the zip codes for the clubs you want to play, AND limit them to people who are interested in your genre of music. Depending on your approach, you can use these ads to simply get your band name out there and garner Facebook “likes,” or you can specifically advertise your events. For more information on Facebook ads, check out our article “How to Promote Your Music with Facebook Ads.” (Note: some details may’ve changed since Facebook Band Pages were updated to Timeline, but the principles still apply.)</br></br>4. Be active on blogs and forums that focus on your target market- Yes, I just said “target market,” and my copy of Radiohead’s Meeting People is Easy just self-destructed. But seriously, whether your target is professional contacts in a town (bookers, promoters, bands, etc.) or the music fans in that town who you hope will attend your show, locally-based music forums and blogs are a great way to get a conversation started. As with all things, don’t be pushy or spammy!</br></br>5. Don’t forget the usual promo stuff- We focus so much of our efforts on social media these days that it’s easy to forget the basics. Remember to send a press release about your tour-stop to the local newspapers, weeklies, and radio stations at least 6 weeks before your appearance. Offer an interview, concert tickets for giveaways, and anything else you think will help spread the promo love. Send posters to the venue and local record stores well in advance. Inquire about in-store and in-studio performance opportunities at record stores, radio stations, and on local TV news shows. Also, call everyone you know in that city and beg them to come out to your show; bribe them with promises of magic beyond their wildest imagining; let them know tardiness and absenteeism will be rewarded with dire consequences. For more information on approaching local radio stations and podcasts, check out our guide “Getting Radio Airplay.”", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 3 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Make Your Own DIY Venue for One Night")
                mail.setMessageBody("I recently saw a video on WeAllMakeMusic.com about how some musicians in the East LA scene, after confronting the fact that their performance opportunities were limited by a dearth of “proper” venues, took it upon themselves to throw their own shows at movie theaters, restaurants, art spaces, etc. With some perseverance and ingenuity, they created an atmosphere where young artists could still flourish despite the lack of an established music-biz infrastructure.</br></br>If you live in an area that doesn’t have any great music clubs, make your own magic happen! No, you don’t have to open your own venue or get a liquor license. But you CAN work with established businesses to transform THEIR space into the world’s coolest music spot for one amazing night. Here is a list of non-traditional venues where I have performed throughout the years:</br></br>Church, park, restaurant, movie theater, clothing store, bookstore, tented stage in parking lot, busking on the street, coffee shop, art gallery, backyard, basement, a boat, warehouse, corporate party, hotel room, record store, guitar shop.</br></br>What’s in it for them?</br></br>Why would a business owner want to help you host an event in their establishment? Well, many of them won’t. But if you can convince just a few local proprietors that you will be respectful, professional, and handle all the heavy-lifting and precautionary work (security and door-person), they may want to help you because it will reflect positively on their company, store, church, or brand. Also, maybe they’re just nice, philanthropic people who want to support the local music scene.</br></br>Where do you begin?</br></br>Hit the pavement. Business owners will be more likely to help you out if you present yourself well in-person. Emails are too easy to ignore. So get out there and meet some people! But be prepared to describe the event you’re imagining in detail: how it will be promoted, how the flow of the event will run, how many attendees you expect, how the money will be split, etc. Will it be free? Will there be food and drink? Who will be expected to do what? Think all this through before presenting your proposal. And above all, be polite!</br></br>Second, you might need to acquire a PA system. Renting one for a single night from a music store or live-sound company will be far cheaper than purchasing one. However, if you live in a town with no “proper” music venues, you may be throwing a lot of your own shows. In this case, perhaps it is worth saving up to purchase your own PA system.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }

        else if indexPath.row == 4 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("How to Design Your Ideal Performance Venue")
                mail.setMessageBody("About 4 years ago, Jack & I decided to “create” the ideal setting for our music simply out of frustration over the fact that it didn’t seem to exist anywhere. We sat down and made a “wish list,” combining all the elements we thought would be perfect for our music. We approached a fine restaurant about initiating the show in their venue (which didn’t even host music at the time), and grew it in popularity to the point where the staff would fight over shifts and the press couldn’t even get in. We then took the concept to a theater where we polished the act and grew it for another 2 years, then took it on the road to breathtaking resorts, and now present the show in one of the most prestigious luxury destinations in the country. Along this journey, we’ve hit some brick walls as well as experienced some epiphanies and awesome success stories.</br></br>I firmly believe we have to set our own value for what we do. As musicians, we are often our own worst enemies. How can we get others to value us if we don’t value ourselves? But the way that “value” is established in this day and age is much different than when we depended on a record label to give us instant credibility, sell us to the masses, and administer the whole thing.</br></br>It goes without saying that you have to be able to back it up! I mean, your value is only substantiated if you bring a pro-level musicality, attitude, and work-ethic to the table. You have to hone your craft, be great at what you do, and be objective!</br></br>But, many will say things like “I’m an Artist, not a business person,” and I get that…I really do. But if you don’t learn to take some control over your own career in this changing music environment, than you’ll be left behind pining for the glory days.</br></br>So, here are some things I’ve learned and that have proven to work beautifully for us and our show in most scenarios. I hope you can take away something useful to apply to your individual musical journey.</br></br>1. Know Your Audience –</br></br>If you were sitting in your audience, watching your show, what would you want to see/hear? Take a few moments and really think about it.</br></br>* Who does your music appeal to?</br></br>* What would be the ideal setting for them to really appreciate your music?</br></br>* What type of place?</br></br>* What size crowd?</br></br>* What kind of ambiance?</br></br>* Make a list, and the ideal setting will begin to slowly materialize in your mind.</br></br>In our case, our original music has elements of romance, it’s a bit nostalgic at times, it’s kind of mellow, and appeals most to baby-boomer couples. We also know what size ticket price we need to charge to make a living at this, especially since we work with a Roster of Pro Songwriters, so we design our shows to appeal to those with some expendable income. When we look at this demographic, we learn they appreciate gourmet cuisine, they are wine and whiskey connoisseurs, they love “atmosphere,” they like to be pampered, they want to be able to “hear the words” of a song at a pleasurable volume, they don’t like to be crammed in to a venue like sardines, they prefer valet or easily accessible parking, it’s important they feel safe in the area of town the show is held, etc. So, with this in mind, we design our show in a luxury resorts with a fine dining room, addressing all of these known elements on the front end, and we deliver an extraordinary experience on every level.</br></br>2. Think Like A Business Owner –</br></br>This is your show, so think like it! This is the time to get your ducks in a row, establish some of your own protocols, BEFORE you approach any venue! Think of yourself as a “team” with a venue and how to make it a “win-win” for everyone. Instead of you being a “nice to have,” make yourself a “GOTTA HAVE”!</br></br>In our case, we try to make life easy on them and then look for ways to make them “shine” to their customers. We have a 100-mile-radius-rule…meaning that we won’t offer this to their competition, making it exclusive to their venue and helping to set them apart. Venues respond well, like an audience, when you have your act together and are proactive in addressing their concerns.</br></br>So we do things like:</br></br>* bring our own PA System</br></br>— we know it and we are never at the mercy of a bad soundman</br></br>* we have an active and ever-growing E-list</br></br>— we are using most viable social media platforms and consistently/responsibly posting</br></br>* Tip – don’t “vent” or post negative comments on your social sites…not kool and potentially embarrassing for any venue that teams with you!</br></br>*  we have a marketing plan for the cities we perform in</br></br>* Enlist the venue’s local publicist who knows the area and has an established, great reputation…and pay her to promote to her E-list and friends/colleagues! Give her some incentives, like comp-tickets for her and a few guests, to the show. It’s much more effective than running an ad unless you have the money to do both</br></br>* Offer ticket give-a-ways to radio stations, chambers of commerce, local bloggers where they can run contests for their listeners/readers</br></br>* Offer them comp-tickets to the event in exchange for the promotion</br></br>* Send the venue professionally appealing posters/framed signs to display at their counter</br></br>* Promote the venue substantially in your marketing efforts along with your show and they will likely reciprocate the gesture – you want them talking about you with enthusiasm and they will when they see this as a team effort</br></br>* have a professional website that is updated constantly and accurately</br></br>— Use Hostbaby or Bandzoogle, ’cause you can easily update them yourself</br></br>— Use lots of pictures!!! Especially of the venue you are going to perform in and link those pics to their site</br></br>— Venues will often link their site to yours, so make sure it’s a great representation they’ll be proud to link</br></br>3. Ticketing –</br></br>Handle our own ticketing, especially when you tour! This is crucial for a variety of reasons. First of all, with a company like TicketLeap (which I highly recommend!!!), you remain in control of your money and prevent new venues from “stiffing you.” TicketLeap is the best platform I’ve seen, and I’ve investigated a ton of them.</br></br>* It’s incredibly user-friendly</br></br>* your ticket pages are very professional and appealing</br></br>* It’s fully integrated with social media, so when folks buy a ticket, they have the option of sharing the info instantly on Facebook or Twitter with their friends</br></br>* you can assign a seating chart if you wish</br></br>* you can embed a ticketing widget easily on your own website so that folks don’t have to leave your site</br></br>* and the best part….you are paid instantly!</br></br>— You can set up a PayPal account (business/merchant is easy to set up and you don’t have to have a credit-check or a biz-license number) and the moment someone buys a ticket, it’s immediately deposited into your PayPal account.</br></br>— You can get a PayPal Mastercard (again, no credit check, works like a debit card), and pull the money off or use your Mastercard like any regular debit card. It’s AWESOME!</br></br>This helped us a lot when we were touring because we no longer had to “front” the money and wait to get paid. Instead, we had the money in our account to cover gas, travel expenses, on the way to the gig.</br></br>The only drawback is that if, for some reason, you have to cancel the show then you must be prepared to refund that money to ticketholders yourself. So, keep that in mind.</br></br>4. Team With A Venue–</br></br>Once you’ve made your lists, gotten your ducks in a row and set up your ticketing, you’re ready to approach a venue. When you come with all of this to the table, most venues will take you seriously and strongly consider teaming with you. If you aren’t going to cost them anything (’cause you’re handling your own ticketing), you have a plan, and you are going to bring them new customers, and offer a great experience, then why would they not team with you? Make sure you have an agreement that covers all the things “you will do” and all the thing “they will do” on the night of the event. The main “unforseens” we’ve come across are things like logistics:</br></br>* Tables/chairs – if this is going to be a sit-down event, and the venue doesn’t have enough, then you’ll have to be proactive about renting them…most venues are not going to want to do this on their own, but they may split the cost with you if they see this event as a benefit to their business. Think also about table coverings, candles on tables, etc. All these things are the “details” that you need to think through.</br></br>* Catering – if your event is going to include a meal, and the venue doesn’t serve food, then find a local caterer that can set it up buffet-style and add the per-plate cost into your ticket price.</br></br>— We’ve had tier ticketing in the past: 1) Ticket including Dinner 2) Show only without Dinner.</br></br>— Most caterers need a head-count, guarantee so they have an idea of how many to cook for, of course, which is why I suggest adding it into the ticket price. That way, you know for sure a few days before the event and you don’t get stuck with a big catering bill that eats up your profits.</br></br>* Door Ticket Coordinator – Crucial to bring your own…and your laptop! Ticketleap will provide you with a real-time, online attendee list, in case someone forgets to bring their ticket to the show. Also, you have the option to get a credit card swiper from them that attaches to your computer for door sales. But you must have your own, internet-savvy, gatekeeper to make sure folks don’t slip in and to also to professionally greet your VIPs.</br></br>* Merch Person – Again, like the gatekeeper, make sure you have somebody you trust lined up for this. Also, something I’ve learned the hard way, make sure you use a lock box and have change for buyers!</br></br>* Set up/Soundcheck – Make sure you do this early in the day (between 2-5pm) so that you are not soundchecking as folks are arriving for your show. Not only does it look unprofessional, but it takes away from the downtime you’ll need to prepare to actually perform after all this business thinking!!!</br></br>Don’t forget to have fun with it! If there is one thing I’ve learned it’s that something is probably going to go wrong despite your best efforts to prepare. Roll with it, give your best performance, and then continue to tweak and polish at future shows. You don’t have to get this all perfect, you just have to get it going! It’s a much different world out there now in music and we have to think outside the box and carve new paths! Don’t get overwhelmed…it gets easier!", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }

        else if indexPath.row == 5 && indexPath.section == 0 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Tour Support <john@joinmusician.com>"])
                mail.setSubject("Play In-Studios and In-Store Performances")
                mail.setMessageBody("Book performances at radio stations and record stores</br></br>Don’t waste the day. I know you want to check out the Hoover Dam or take that excursion to the top of the Empire State Building, but touring is NOT a vacation! The bands who are lucky enough to turn touring into a full-time job get to where they’re at because they bust their butts on the road, using every available hour to promote their music.</br></br>“You can sleep when you’re dead.”</br></br>For each town where you’ve booked an evening gig, make sure to contact:</br></br>1) the hip, local brick-and-mortar record shop and ask if you can do an in-store performance.</br></br>2) local radio stations (especially community and college radio) to see if you can play in-studio or do a short on-air interview and spin some tracks off your album.</br></br>When you’re contacting the store manager, event planner, DJ, or program director, be polite. Make it enticing. Offer free CD or ticket giveaways. Record radio bumpers.</br></br>Then when it’s time to play, make sure all the underage kids come to the in-stores. Collect everyone’s email addresses. Encourage folks to come out to your show later that night. Repeat in the next town.</br></br>Remember:</br></br>* even if the listenership or turnout is minimal, in-studios and in-stores are excellent video and photo opportunities that make great content for the web!</br></br>* if you sell your CDs or vinyl on consignment through the store, make sure to keep track and follow up. Read this article for more details.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
    }

    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
  }


extension SupportTableViewController: MusicianBookingPlusViewControllerDelegate {
    func musicianBookingViewControllerDidCancel() {
        self.tabBarController?.selectedIndex = 0
    }
    
    func musicianBookingViewControllerDidPurchase() {
        UserDefaults.standard.set(true, forKey: "purchased")
    }
}

