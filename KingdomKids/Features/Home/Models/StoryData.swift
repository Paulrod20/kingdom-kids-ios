//
//  StoryData.swift
//  KingdomKids
//
//  Created by Paul Rodriguez on 5/25/26.
//

import Foundation
import SwiftUI

struct Story: Hashable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let emoji: String
    let color: Color
    let ageGroups: [AgeGroup]
    let isLocked: Bool
    let scripture: String
    let scriptureText: String
    let pages: [String]
}

let storiesData: [Story] = [
    Story(
        title: "The Beginning of the World",
        subtitle: "A story of creation",
        emoji: "🌍",
        color: Color.kkStoryCreation,
        ageGroups: [.toddler, .explorer],
        isLocked: false,
        scripture: "Genesis 1:1",
        scriptureText: "In the beginning God created the heavens and the earth.",
        pages: [
            "In the very beginning, there was nothing — no light, no sky, no animals, no people. Just God, full of love and full of power.",
            "On the first day, God said \"Let there be light!\" and the darkness disappeared. God saw the light and smiled — it was good! ☀️",
            "Day by day, God made the sky, the oceans, the land, the sun, the moon, and every animal. Each day God looked at what He made and said it was good. 🌊🌿",
            "On the sixth day, God made something very special — people, made in His own image. He made a man named Adam and a woman named Eve. 👫",
            "On the seventh day, God rested. He looked at everything He had made and said it was very good. And it was! 🌟"
        ]
    ),
    Story(
        title: "Adam & Eve",
        subtitle: "The beginning of everything",
        emoji: "🌳",
        color: Color.kkStoryEden,
        ageGroups: [.toddler, .explorer],
        isLocked: false,
        scripture: "Genesis 2:7",
        scriptureText: "The Lord God formed the man from the dust of the ground and breathed into his nostrils the breath of life.",
        pages: [
            "After God made the beautiful world, He wanted someone to enjoy it. So He took some dust from the ground and breathed life into it — and a man named Adam appeared! 🌬️",
            "God placed Adam in a wonderful garden called Eden. It was full of trees, flowers, rivers, and animals. God told Adam to take care of it and gave him one rule — don't eat from the tree in the middle of the garden. 🌸",
            "God saw that Adam was lonely, so while Adam slept, God made something wonderful. He took one of Adam's ribs and created a woman named Eve. Adam was so happy — he finally had a friend and partner! 💕",
            "Adam and Eve lived happily in the garden. They walked with God, cared for the animals, and enjoyed everything He had made. Life was perfect and beautiful. 🦋",
            "But one day a sneaky serpent came to Eve and told her to eat the fruit from the forbidden tree. Eve listened to the serpent instead of God, and Adam did too. 🍎",
            "When God came to walk with them that evening, Adam and Eve hid because they felt ashamed. God was sad, but even then He loved them. He made clothes for them and promised that one day everything would be made right again. 🌅"
        ]
        
    ),
    Story(
        title: "Noah's Ark",
        subtitle: "God saves Noah and the animals",
        emoji: "🚢",
        color: Color.kkStoryArk,
        ageGroups: [.toddler, .explorer],
        isLocked: false,
        scripture: "Genesis 6:22",
        scriptureText: "Noah did everything just as God commanded him.",
        pages: [
            "A long time after Adam and Eve, the world had become very sad. People had forgotten about God and were doing wrong things. But there was one man who still loved God with all his heart — his name was Noah. 🌧️",
            "One day God spoke to Noah and said something surprising. He told Noah to build a giant boat called an ark — even though there was no water nearby! Noah trusted God and got to work right away. 🔨",
            "God told Noah to make the ark big enough for his whole family and two of every animal on earth. Noah obeyed. He built and built until the ark was finished. His neighbors laughed at him, but Noah kept trusting God. 🦒🦁🐘",
            "When the ark was ready, the animals came two by two — big ones and small ones, loud ones and quiet ones. God brought them all to Noah and they walked right onto the ark! 🐦🐊🐻",
            "Then the rain began. It rained for forty days and forty nights! Water covered everything. But Noah, his family, and all the animals were safe and dry inside the ark. God was protecting them. ⛈️",
            "Finally the rain stopped. Noah sent out a dove and it came back with an olive branch — a sign that dry land was near! Soon the ark rested on a mountain and everyone stepped out onto dry ground. 🕊️",
            "God put a beautiful rainbow in the sky as a promise — He would never flood the whole earth again. Every time we see a rainbow, we can remember God keeps His promises! 🌈"
        ]
    ),
    Story(
        title: "Joseph's Coat of Many Colors",
        subtitle: "A coat and a big dream",
        emoji: "🌈",
        color: Color.kkStoryJoseph,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "Genesis 37:3",
        scriptureText: "Now Israel loved Joseph more than any of his other sons, and he made an ornate robe for him.",
        pages: [
            "Joseph was one of twelve brothers, and his father Jacob loved him very much. To show his love, Jacob gave Joseph a beautiful coat of many colors — the most special coat anyone had ever seen! 🌈",
            "But Joseph's brothers were jealous. They didn't like that their father loved Joseph so much. When Joseph told them about his dreams where they all bowed down to him, they got even more upset. 😠",
            "One day Joseph's brothers were out in the fields and Joseph came to check on them. When they saw him coming in his colorful coat, they made a terrible decision — they threw him into a pit and sold him to strangers going to Egypt. 😢",
            "Joseph could have been angry and given up on God. But even in Egypt as a servant, Joseph worked hard and trusted God. God was with Joseph every step of the way, even when things seemed impossible. 🙏",
            "Joseph had a special gift from God — he could understand dreams. When the king of Egypt, called Pharaoh, had a confusing dream, Joseph explained it. Pharaoh was so amazed he made Joseph one of the most powerful men in all of Egypt! 👑",
            "Years later a great famine came and Joseph's brothers traveled to Egypt for food. They didn't recognize Joseph — but Joseph recognized them! Instead of being angry, Joseph forgave his brothers and hugged them with tears of joy. 🤗",
            "Joseph told his brothers not to be afraid. He said what they meant for harm, God used for good. God had a plan all along! Joseph's whole family moved to Egypt and they were together again. 💛"
        ]
    ),
    Story(
        title: "Baby Moses",
        subtitle: "God protects baby Moses",
        emoji: "🧺",
        color: Color.kkStoryMoses,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "Exodus 2:10",
        scriptureText: "When the child grew older, she took him to Pharaoh's daughter and he became her son. She named him Moses.",
        pages: [
            "Many years after Joseph, the Israelite people were living in Egypt. A new Pharaoh came to power who didn't remember Joseph. He made God's people slaves and treated them very harshly. 😔",
            "Pharaoh became scared because there were so many Israelites. He made a terrible rule — every baby boy born to the Israelites had to be thrown into the river. It was a very dark and scary time. 😢",
            "But one mother refused to give up on her baby boy. She hid him for three months. When she could no longer hide him, she made a little basket boat, placed him gently inside, and set him among the reeds of the river. 🧺",
            "The baby's big sister Miriam watched from a distance to see what would happen. Then something amazing occurred — Pharaoh's own daughter came to the river to bathe and heard the baby crying! 👀",
            "Pharaoh's daughter felt sorry for the baby and wanted to keep him. Miriam ran over and asked if she should find an Israelite woman to nurse the baby. Pharaoh's daughter said yes — and Miriam brought the baby's own mother! 🌟",
            "God had protected the baby in the most amazing way. His own mother got to care for him and was even paid for it! When he was older, he went to live in the palace as Pharaoh's daughter's son. She named him Moses. 👶",
            "God had a very special plan for Moses. Even as a tiny baby floating in a basket, God was watching over him every moment. No matter how scary life gets, God always has a plan! 🙏"
        ]
    ),
    Story(
        title: "David & Goliath",
        subtitle: "A small boy defeats a giant",
        emoji: "🪨",
        color: Color.kkStoryDavid,
        ageGroups: [.explorer],
        isLocked: true,
        scripture: "1 Samuel 17:45",
        scriptureText: "David said to the Philistine, 'You come against me with sword and spear, but I come against you in the name of the Lord Almighty.'",
        pages: [
            "The Israelites were at war with a fierce army called the Philistines. Every day a giant warrior named Goliath would come out and shout at the Israelites. He was over nine feet tall and wore heavy armor. Everyone was terrified! 😨",
            "Goliath would shout 'Send someone to fight me! If he wins, we will be your servants. If I win, you will be ours!' But not one single soldier in Israel's army was brave enough to step forward. They all ran away in fear. 🏃",
            "A young shepherd boy named David came to bring food to his brothers who were soldiers. When David heard Goliath shouting and mocking God, he couldn't believe no one was standing up to him. 😤",
            "David told King Saul he would fight Goliath. Everyone laughed — David was just a boy! But David said that God had helped him protect his sheep from lions and bears. He knew God would help him now too. 🦁",
            "King Saul offered David his armor but it was way too big and heavy. So David went to a stream and picked up five smooth stones. He walked toward the giant with just his sling and his faith in God. 🪨",
            "Goliath laughed when he saw David coming. But David ran toward him and shouted that he came in the name of the Lord! David put a stone in his sling, swung it around, and released it. The stone hit Goliath right in the forehead and the giant fell to the ground! 💥",
            "The whole army watched in amazement. A small boy with a stone and faith in God had defeated the greatest giant anyone had ever seen. David showed everyone that with God on your side, nothing is impossible! 🙌"
        ]
    ),
    Story(
        title: "Daniel & the Lions",
        subtitle: "God protects Daniel",
        emoji: "🦁",
        color: Color.kkStoryDaniel,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "Daniel 6:22",
        scriptureText: "My God sent his angel, and he shut the mouths of the lions. They have not hurt me, because I was found innocent in his sight.",
        pages: [
            "Daniel was one of God's most faithful servants. He had been taken far from home to a land called Babylon, but no matter where he was, Daniel prayed to God three times every single day. 🙏",
            "Daniel was so wise and trustworthy that the king made him one of the most important leaders in the whole kingdom. But some jealous men didn't like Daniel and wanted to get rid of him. 😠",
            "The jealous men came up with a sneaky plan. They convinced the king to make a new law — for thirty days no one could pray to anyone except the king. Anyone who broke the law would be thrown into a den of hungry lions! 🦁",
            "Daniel heard about the new law but he didn't change a thing. He went home, opened his window toward Jerusalem, and prayed to God just like he always did. The jealous men saw him and ran to tell the king. 😤",
            "The king was very sad because he liked Daniel. But the law couldn't be changed. With a heavy heart the king had Daniel thrown into the lions den. He called out to Daniel 'May your God whom you serve rescue you!' 👑",
            "The king couldn't sleep all night worrying about Daniel. At the very first light of dawn he ran to the lions den and called out — Daniel answered! God had sent an angel to shut the lions mouths and Daniel wasn't hurt at all! 🌅",
            "The king was overjoyed! He had Daniel lifted out of the den and ordered everyone in the kingdom to honor Daniel's God. Daniel continued to trust God his whole life and God never stopped watching over him. 🌟"
        ]
    ),
    Story(
        title: "Jonah & the Whale",
        subtitle: "God gives Jonah a second chance",
        emoji: "🐋",
        color: Color.kkStoryJonah,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "Jonah 2:1",
        scriptureText: "From inside the fish Jonah prayed to the Lord his God.",
        pages: [
            "One day God told a man named Jonah to go to a big city called Nineveh and tell the people there to stop doing wrong things. But Jonah didn't want to go. Instead he ran the other way and jumped on a boat sailing far away! 🚢",
            "God sent a huge storm that rocked the boat so violently that the sailors were terrified. Everyone was praying to their gods. Jonah knew the storm was because of him — he told the sailors to throw him into the sea. 🌊",
            "The moment Jonah hit the water the storm stopped. The sailors were amazed! But Jonah sank down into the dark cold ocean. Just when it seemed like the end, God sent an enormous whale that swallowed Jonah whole! 🐋",
            "Inside the belly of the whale it was dark and scary. But Jonah finally talked to God. He prayed and said he was sorry for running away. He thanked God for saving his life and promised to obey. 🙏",
            "After three days God spoke to the whale and it swam to shore and spit Jonah out onto dry land! Jonah must have been so relieved to feel solid ground under his feet again. 🏖️",
            "God spoke to Jonah again — go to Nineveh. This time Jonah obeyed. He walked through the city telling everyone to turn back to God. And something amazing happened — the people listened! The whole city said sorry to God. 🎉",
            "Jonah's story shows us that we can never run from God. And even when we make mistakes and disobey, God gives us second chances. His love and mercy never run out! 💙"
        ]
    ),
    Story(
        title: "The Birth of Jesus",
        subtitle: "A new beginning",
        emoji: "👶",
        color: Color.kkStoryJesus,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "Luke 2:11",
        scriptureText: "Today in the town of David a Savior has been born to you; he is the Messiah, the Lord.",
        pages: [
            "Long ago God made the most amazing promise — He would send someone very special to the world. Someone who would love people perfectly and make everything right again. That someone was His own Son, Jesus. 🌟",
            "God sent an angel named Gabriel to a young woman named Mary. The angel told Mary she would have a baby boy and she should name Him Jesus. Mary was surprised but she trusted God completely and said yes. 👼",
            "Mary was engaged to a kind man named Joseph. God also sent an angel to Joseph in a dream to tell him about the baby. Joseph loved Mary and trusted God too. He would help take care of baby Jesus. 🌙",
            "Mary and Joseph had to travel to a town called Bethlehem. It was a long journey and when they arrived every inn was full. The only place they could find was a stable — a place where animals slept. That night in that humble stable, Jesus was born. 🐑",
            "Mary wrapped baby Jesus in soft cloths and laid Him in a manger — a feeding box for animals. The Son of God, the most important baby ever born, slept in a simple stable surrounded by love. 💕",
            "That same night nearby shepherds were watching their sheep when suddenly the sky filled with light and angels appeared! The angels sang and said the Savior had been born. The shepherds ran as fast as they could to find baby Jesus. 🎶",
            "When the shepherds found Mary, Joseph, and baby Jesus they fell to their knees in wonder. Then they ran through the streets telling everyone what they had seen and heard. Jesus had come into the world and nothing would ever be the same again! 🙌"
        ]
    ),
    Story(
        title: "The Good Samaritan",
        subtitle: "Love your neighbor",
        emoji: "🤝",
        color: Color.kkStorySamaritan,
        ageGroups: [.explorer],
        isLocked: true,
        scripture: "Luke 10:27",
        scriptureText: "Love the Lord your God with all your heart and with all your soul and with all your strength and with all your mind, and love your neighbor as yourself.",
        pages: [
            "One day a man asked Jesus a question — who is my neighbor? Jesus answered with a story. It was about a man traveling on a long dusty road from Jerusalem to Jericho. It was a dangerous road known for robbers. 🛣️",
            "Sure enough robbers jumped out and attacked the traveling man. They took everything he had, beat him up, and left him lying on the side of the road barely able to move. Things looked very bad for him. 😢",
            "After a while a priest came walking down the same road. He saw the hurt man lying there. But instead of stopping to help, the priest crossed to the other side of the road and walked right past. 😟",
            "Then another religious leader came down the road. Surely he would stop and help! But he also looked at the hurt man and walked right by without doing anything. The poor man was still alone and in pain. 💔",
            "Then a Samaritan came along. Samaritans and Jews didn't usually get along at all. But when this Samaritan saw the hurt man his heart was filled with compassion. He stopped right away and knelt beside him. 🙏",
            "The Samaritan cleaned and bandaged the man's wounds. He put him on his own donkey and took him to an inn. He paid the innkeeper to take care of him and said he would pay any extra costs on his way back. 🏨",
            "Jesus asked which of the three men was a true neighbor. The answer was clear — the one who showed kindness and love. Jesus said go and do the same. Being a good neighbor means helping anyone who needs it no matter who they are! 💛"
        ]
    ),
    Story(
        title: "Jesus Feeds 5000",
        subtitle: "A little becomes a lot",
        emoji: "🍞",
        color: Color.kkStoryFeeding,
        ageGroups: [.toddler, .explorer],
        isLocked: true,
        scripture: "John 6:11",
        scriptureText: "Jesus then took the loaves, gave thanks, and distributed to those who were seated as much as they wanted. He did the same with the fish.",
        pages: [
            "One day a huge crowd of people followed Jesus to a hillside because they wanted to hear Him teach and see His miracles. There were so many people — over five thousand of them! They listened to Jesus all day long. 👥",
            "As the day went on everyone started getting very hungry. Jesus turned to His disciple Philip and asked where they could buy bread to feed all these people. Philip looked at the crowd and said it would take more money than they had! 😧",
            "Another disciple named Andrew found a young boy in the crowd who had brought his own lunch — five small loaves of bread and two little fish. Andrew brought the boy to Jesus but wondered how such a tiny amount could feed so many people. 🐟",
            "Jesus didn't seem worried at all. He told everyone to sit down on the grass. Then He took the five loaves and two fish, looked up to heaven, and gave thanks to God. He began breaking the bread and fish into pieces. 🙏",
            "Something absolutely amazing happened. As Jesus broke the bread and fish and handed it to His disciples to pass out, it never ran out! Every single person in that enormous crowd got as much food as they wanted. 😲",
            "When everyone had eaten and was completely full the disciples collected the leftovers. They filled twelve whole baskets with the pieces of bread and fish that were left over. More food was left over than they started with! 🧺",
            "Jesus showed everyone that day that nothing is impossible with God. When we bring what little we have and trust it to Jesus, He can do more than we could ever imagine. Even a small lunch in the right hands can feed thousands! 🌟"
        ]
    ),
]
