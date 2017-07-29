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
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>Part of being a DIY musician is about managing impressions. No matter how much you want to play at the hippest venue or be on a big stage, playing to half-empty clubs is bad for business. Instead, book yourself in a venue that is too small for you and your fans. Whether you’ve brought out 300 people to a 600-seat theater or sold 5,000 tickets in a 10,000-capacity arena, those vacant chairs are going to weigh on you and your audience. Think smaller.</br></br>“SOLD OUT” has a certain ring to it. And even if you’ve only “sold out” a coffee shop that holds 30 people, the venue will want to have you back! And more importantly, word will spread to other bookers, bands, music fans, and media that you “packed the place out.” Sure, there were only 30 people there. But a tiny room that’s full of fans can sometimes seem more impressive than a big room that isn’t.</br></br>Be realistic about your estimated draw. Don’t get lost in delusions of grandeur. Then approach the venues that will accommodate just UNDER that number. Yes, I know it sounds counterintuitive when you want to build a fan base and make money. While you shouldn’t adopt this strategy in every case, when you’re first starting out, some well-placed “sold-out” shows can go a long way.", isHTML: true)
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>An open mic is a great place to begin for 3 types of players:</br></br>* Musicians who are new to songwriting and don’t yet have enough strong original material for a 45 minute set.</br></br>* Musicians who may have songwriting and instrumental skills, but who feel they lack performance skills, confidence, etc.</br></br>* Confident songwriters/performers who are new to a town or region and don’t yet have a local fanbase.</br></br>How do you make the transition?</br></br>1. Play weekly at the open mics:</br>Whether you’re building your repertoire, building an audience, or building up your confidence, get out there as much as possible. Open mic audiences tend to be respectful and receptive, so this is one of the best ways to get live experience in a low-pressure setting. Plus, keeping it weekly will help you stay motivated on all the other fronts (songwriting, practicing, etc.)</br></br>2. Build your email list from the beginning:</br>It’s never too early to start gathering contact info for the people who enjoy your music. Even if you don’t have any recorded music, merch, or gigs to announce (besides your open mics, of course)– you will someday! And when you’ve got big news to share, you’ll have an audience for that news. Don’t be pushy about collecting contacts; simply mention that you have a signup list and that you’d love to keep people notified about your music.</br></br>3. Announce your name at the beginning and end of your open mic set:</br>It’s sometimes hard to get into the promotion mindset at an open mic. They can seem rather informal and low on the drama-scale. But a quick “Hey, my name is____ …..” and a concluding “Thanks, my name is ______ and I appreciate you listening; I have a mailing list….” at the end of your short set will help you, literally, get your name out there.</br></br>4. Stay for the whole open mic and make friends:</br>Your early shows will be attended by mostly friends. An open mic is one great place to make those friends. So don’t just pop into the open mic for your 15 minutes of glory and then duck out. Stay and get to know people. Trade info. See if any other talented folks might want to play in your band down the line (if you’re interested in fleshing out your songs with band arrangements). At the very least, get to know each other’s songs and styles. If you come back every week, you could be singing harmonies on one another’s tunes.</br></br>As you get to know more musicians, you’re also spreading your networking roots. Some of the people you befriend may have bands that you can open for; they may know booking agents; they may sign your mailing list too– and they may be your biggest early supporters.</br></br>5. Get to know the staff at the venue:</br>Most open mics are held at music venues. If you befriend the bar staff, the booker, the manager, the owner, and the patrons, it’s a short jump from a Sunday night open mic to a Thursday opening slot. If you’ve proven to be one of the popular performers week after week at an open mic, the booker will probably already be on your side. But don’t assume they’ll reach out to you first; booking agents have a hundred things on their minds at once. Make sure you ask them for the gig (once you feel ready)!</br></br>6. Balance your 3-song set:</br>People love familiar songs. When you first start performing at open mics, stick to your best 3 songs. Even if you’re sick of them, repeat them for the first 2 or 3 times you play at a particular open mic. Then slowly work in newer material by playing 2 of the now familiar favorites, and one new one. Then the next week, play one of the oldest tunes, the newer one from the previous week, and one brand new tune. From there, you can keep churning up the dirt how you like, but return to the tunes enough so that the regulars can get to know them. When you finally bring all those folks out to your first proper show, they may just sing along to a few songs.</br></br>7. Morph an open mic into a songwriters-in-the-round:</br>Instead of putting ALL the pressure on yourself for that big leap from open mic to proper gig, why not round up 2 more songwriters you’ve met and do a songwriters-in-the-round set? That’s where 3 or more performers trade off on tunes. You can either rotate after every song, or give each person 2 or 3 tunes before you rotate to the next singer. Instead of one person’s draw, you’re potentially combining all three performers’ followings for one awesome night. That’ll please the booker and give you the chance to win over some of the other writers’ fans.", isHTML: true)
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>Many musicians who draw decent hometown crowds feel a little bit stuck when it comes to touring; they don’t know how to make that leap into a wider world where no one’s heard of their band.</br></br>1. Forge relationships with bands in other cities </br></br>2. Look for the smaller, quality venues</br></br>3. Advertise your show on Facebook</br></br>4. Be active on blogs and forums that focus on your target market</br></br>5. Don’t forget the usual promo stuff", isHTML: true)
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>If you live in an area that doesn’t have any great music clubs, make your own magic happen! No, you don’t have to open your own venue or get a liquor license. But you can work with established businesses to transform their space into the world’s coolest music spot for one amazing night. Here is a list of non-traditional venues where I have performed throughout the years:</br></br>Church, park, restaurant, movie theater, clothing store, bookstore, tented stage in parking lot, busking on the street, coffee shop, art gallery, backyard, basement, a boat, warehouse, corporate party, hotel room, record store, guitar shop.</br></br>What’s in it for them?</br></br>Why would a business owner want to help you host an event in their establishment? Well, many of them won’t. But if you can convince just a few local proprietors that you will be respectful, professional, and handle all the heavy-lifting and precautionary work (security and door-person), they may want to help you because it will reflect positively on their company, store, church, or brand. Also, maybe they’re just nice, philanthropic people who want to support the local music scene.</br></br>Where do you begin?</br></br>Hit the pavement. Business owners will be more likely to help you out if you present yourself well in-person. Emails are too easy to ignore. So get out there and meet some people! But be prepared to describe the event you’re imagining in detail: how it will be promoted, how the flow of the event will run, how many attendees you expect, how the money will be split, etc. Will it be free? Will there be food and drink? Who will be expected to do what? Think all this through before presenting your proposal.", isHTML: true)
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>Here are some things I’ve learned and that have proven to work beautifully for my shows in most scenarios. I hope you can take away something useful to apply to your individual musical journey.</br></br>1. Know Your Audience:</br></br>* Who does your music appeal to?</br></br>* What would be the ideal setting for them to really appreciate your music?</br></br>* What type of place?</br></br>* What size crowd?</br></br>* What kind of ambiance?</br></br>* Make a list, and the ideal setting will begin to slowly materialize in your mind.</br></br>2. Think Like A Business Owner:</br></br>* bring your own PA System</br></br>* have an active and ever-growing Email list</br></br>* have a marketing plan for the cities we perform in</br></br>* Enlist the venue’s local publicist who knows the area and has an established, great reputation…and pay her to promote to her E-list and friends/colleagues! Give her some incentives, like comp-tickets for her and a few guests, to the show. It’s much more effective than running an ad unless you have the money to do both</br></br>* Offer ticket give-a-ways to radio stations, chambers of commerce, local bloggers where they can run contests for their listeners/readers</br></br>* Offer them comp-tickets to the event in exchange for the promotion</br></br>* Send the venue professionally appealing posters/framed signs to display at their counter</br></br>* Promote the venue substantially in your marketing efforts along with your show and they will likely reciprocate the gesture – you want them talking about you with enthusiasm and they will when they see this as a team effort</br></br>* have a professional website that is updated constantly and accurately</br></br>3. Ticketing:</br></br>Handle your own ticketing, especially when you tour. This is crucial for a variety of reasons. First of all, with a company like TicketLeap (which I highly recommend), you remain in control of your money and prevent new venues from “stiffing you.” TicketLeap is the best platform I’ve seen, and I’ve investigated a ton of them.</br></br>4. Team With A Venue:</br></br>Once you’ve made your lists, gotten your ducks in a row and set up your ticketing, you’re ready to approach a venue. When you come with all of this to the table, most venues will take you seriously and strongly consider teaming with you.* Merch Person – Again, like the gatekeeper, make sure you have somebody you trust lined up for this. Also, something I’ve learned the hard way, make sure you use a lock box and have change for buyers!</br></br>* Set up/Soundcheck – Make sure you do this early in the day (between 2-5pm) so that you are not soundchecking as folks are arriving for your show. Not only does it look unprofessional, but it takes away from the downtime you’ll need to prepare to actually perform after all this business thinking!</br></br>Don’t forget to have fun with it! If there is one thing I’ve learned it’s that something is probably going to go wrong despite your best efforts to prepare. Roll with it, give your best performance, and then continue to tweak and polish at future shows. You don’t have to get this all perfect, you just have to get it going! It’s a much different world out there now in music and we have to think outside the box and carve new paths! Don’t get overwhelmed…it gets easier.", isHTML: true)
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
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>Book performances at radio stations and record stores.</br></br>For each town where you’ve booked an evening gig, make sure to contact:</br></br>1) the hip, local brick-and-mortar record shop and ask if you can do an in-store performance.</br></br>2) local radio stations (especially community and college radio) to see if you can play in-studio or do a short on-air interview and spin some tracks off your album.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 0 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("How to Make a Stage Plot and Input List")
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>If your band tours, you need a stage plot. Even if you don’t tour, you’ll be making the lives of club owners, bookers, and live-sound engineers easier in your home town by sending them an accurate stage plot and input list well in advance of your show.</br></br>A stage plot is a graphic representation that illustrates your band’s setup when you perform live, your placement on stage, what gear you use, and some other helpful information. Be sure to include:</br></br>* A basic visual that shows where each member is positioned on stage.</br></br>* The names of each member and what instruments they play.</br></br>* How many mics, DIs, monitors, and cables (XLRs or 1/4 inch) you’ll need the venue to provide.</br></br>* What sound gear (DIs, mics, etc), if any, you’ll be providing.</br></br>* Whether or not bass and keyboard amplifiers have balanced outputs. Will they be mic’d or run direct?</br></br>* Where the amps will be placed in relation to the players.</br></br>Providing a stage plot will make your load-in, setup, and soundcheck experience quick and efficient. The sound person won’t have to do any last minute scrambling, either. You both want to save your energy for the show!", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 1 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("How to Properly Advance Your Next Show")
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>The gig is booked and you’re stoked to play your hometown venue even though the club has changed owners since you last played there 5 years ago. It’s the day of the show and you arrive for soundcheck and meet the sound guy, only to find out he has no clue about you even being on the bill. You look around the venue and there are no posters or flyers around promoting your show. It’s as if no one confirmed that the show was actually happening. Worse case scenario? Maybe. But it’s also more common than you may imagine. Luckily, this type of mixup can be easily avoided by properly advancing your show.</br></br>Advancing a show- confirming in “advance” all of the details surrounding your gig with a venue contact.</br></br>Once you’ve confirmed your show, the booker should send you a contract or email with all the necessary show details. If they don’t, ask for the info yourself.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 2 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("Selling More Merch at Shows")
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>1. Step up Your Presentation</br></br>How many times have you seen a band drag out a cardboard box at the end of their show and place it at the foot of the stage?</br></br>Then somebody mumbles something into the mic about CDs and walks away. If you want to sell merch, you need to SELL it. Present it in an attractive way and put your best salesman (or woman) at the helm.</br></br>Bring a tablecloth and maybe a suitcase you can display your albums in.</br></br>Decorate with items of interest. What will make people stop by and ask “what’s that?” or say “that’s cool!”?</br></br>Instead of writing your prices on a dirty cocktail napkin, get one of your artistic friends or bandmates to create a sign with style. What about calligraphy, a woodcut or a painting?</br></br>Bring tape, tacks, hangers and whatever else you need to display your T-shirts, posters, and other merch in a semi-orderly fashion, so fans can easily see what’s available.</br></br>Set up the merch before you play, and make sure it’s attended to during your performance.</br></br>Bring a light. Clubs are dark. Make sure your merch is visible.</br></br>2. Give Them Payment Options</br></br>Make sure to bring some one-dollar bills for change, and don’t charge 9.99 for anything unless you have a big bag of change.</br></br>Not everybody has cash on hand. Sign up for Square so you can take credit cards at your shows</br></br>3. Sell More than Just CDs</br></br>Not everybody still listens to CDs. Sell download cards for the digitally inclined. Sell vinyl for the music collectors.</br></br>Sell T-shirts, mugs, stickers, DVDs.</br></br>Try to think of items that your audience will connect with.</br></br>4. Sell From the Stage</br></br>You’ve got the ears of your audience. Take advantage.</br></br>Describe what you’re selling on the mic.</br></br>Introduce the person who is selling your stuff. Tell the audience how nice and approachable they are.</br></br>Don’t wait until the end of the set to sell your wares; plant the seed after your first few songs. Remind them again at the end of your set.", isHTML: true)
                present(mail, animated: true, completion: nil)
            } else {
                print("Cannot send mail")
                // give feedback to the user
            }
        }
        
        else if indexPath.row == 3 && indexPath.section == 1 {
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["Gig Support <john@joinmusician.com>"])
                mail.setSubject("Summer Touring Checklist")
                mail.setMessageBody("<b>Read below before you email in a question.</b></br></br>1. Mail Posters to clubs 6 weeks in advance. If possible, write or call the booker to see what sizes and quantities they prefer.</br></br>2. If you’re not renting a vehicle, make sure to get your van, car, or bus serviced. Make sure the oil is changed, brakes are good, etc.</br></br>3. Plan your days in advance. That way no one can argue with you when you wake them up to leave at 7am for the next city.</br></br>4. Bring extras of everything: strings, cables, mics, picks, sticks, etc.</br></br>5. Know in advance where you’re staying each night.</br></br>6. Check in with all the venues a week in advance of your show to make sure everything is still going to proceed according to plan. Adjust accordingly.", isHTML: true)
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

