--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: products; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.products OWNER TO dbuser;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO dbuser;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_recipes; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.products_recipes (
    id_recipe integer NOT NULL,
    id_product integer NOT NULL
);


ALTER TABLE public.products_recipes OWNER TO dbuser;

--
-- Name: recipes; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    likes integer DEFAULT 0,
    dislikes integer DEFAULT 0,
    created_by integer NOT NULL,
    created_at date,
    image character varying(250)
);


ALTER TABLE public.recipes OWNER TO dbuser;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO dbuser;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: user_details; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.user_details (
    id integer NOT NULL,
    user_name character varying(100) NOT NULL,
    user_surname character varying(100) NOT NULL
);


ALTER TABLE public.user_details OWNER TO dbuser;

--
-- Name: user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.user_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_details_id_seq OWNER TO dbuser;

--
-- Name: user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.user_details_id_seq OWNED BY public.user_details.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dbuser
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_email character varying(250),
    user_password character varying(250),
    id_user_details integer
);


ALTER TABLE public.users OWNER TO dbuser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dbuser
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dbuser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dbuser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: user_details id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.user_details ALTER COLUMN id SET DEFAULT nextval('public.user_details_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.products (id, name) FROM stdin;
1	egg
4	tomato
5	pasta
6	cucumbers
7	chicken
8	flour
9	rice
10	butter
11	pork
12	beef
13	cheese
14	garlic
15	bacon
16	corn
17	milk
18	mushrooms
\.


--
-- Data for Name: products_recipes; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.products_recipes (id_recipe, id_product) FROM stdin;
25	1
25	10
25	17
26	4
26	5
27	5
27	8
27	10
27	13
27	17
28	5
28	6
28	14
29	7
29	9
29	14
30	7
30	9
30	10
30	13
30	15
30	18
31	10
31	11
31	14
32	12
32	14
33	4
33	5
33	10
33	13
33	14
33	16
34	8
34	10
34	14
34	18
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.recipes (id, title, description, likes, dislikes, created_by, created_at, image) FROM stdin;
32	Homemade Beef Jerky	Whisk together Worcestershire sauce, soy sauce, smoked paprika, honey, black pepper, red pepper flakes, garlic powder, and onion powder in a large bowl. Add beef; mix until completely coated with marinade. Cover the bowl with plastic wrap and marinate in the refrigerator, 3 hours to overnight.\r\n<br>\r\nPreheat the oven to 175 degrees F (80 degrees C). Line a baking sheet with aluminum foil and place a wire rack on top.\r\n<br>\r\nTransfer beef to paper towels to dry. Discard marinade. Arrange beef slices in a single layer on the prepared wire rack on the baking sheet.\r\n<br>\r\nBake in the preheated oven until dry and leathery, 3 to 4 hours. Cut with scissors into bite-sized pieces.	0	0	7	2023-02-04	beef-jerky.png
34	Mushroom Soup	STEP 1<br>\r\nHeat the butter in a large saucepan and cook the onions and garlic until soft but not browned, about 8-10 mins.\r\n<br>\r\nSTEP 2<br>\r\nAdd the mushrooms and cook over a high heat for another 3 mins until softened. Sprinkle over the flour and stir to combine. Pour in the chicken stock, bring the mixture to the boil, then add the bay leaf and simmer for another 10 mins.\r\n<br>\r\nSTEP 3<br>\r\nRemove and discard the bay leaf, then remove the mushroom mixture from the heat and blitz using a hand blender until smooth. Gently reheat the soup and stir through the cream (or, you could freeze the soup at this stage – simply stir through the cream when heating). Scatter over the parsley, if you like, and serve.	1	0	7	2023-02-04	mushroom-soup.png
33	Corn and Tomato Gnocchi	Step 1 <br>\r\nPreheat grill over medium- high heat. Cut 4 sheets of foil about 12 inches long. \r\n<br>Step 2\r\n<br>Divide gnocchi, corn, tomatoes, butter, and garlic evenly over the foil. Season each packet with ¼ teaspoon salt and a pinch of red pepper flakes. Drizzle the white wine evenly among each packet.  \r\n<br>Step 3\r\n<br>Fold foil packets crosswise over the gnocchi mixture to completely cover the food. Roll top and bottom edges to seal.\r\n<br>Step 4\r\n<br>Place foil packets on the grill and cook until tomatoes burst and gnocchi is cooked through, about 15 to 20 minutes. Sprinkle each packet with basil, parmesan, and black pepper, and serve.	0	0	7	2023-02-04	corn-gnocchi.png
25	Scrambled Eggs	STEP 1<br>\r\nLightly whisk 2 large eggs, 6 tbsp single cream or full cream milk and a pinch of salt together until the mixture has just one consistency.\r\n<br>\r\nSTEP 2<br>\r\nHeat a small non-stick frying pan for a minute or so, then add a knob of butter and let it melt. Don’t allow the butter to brown or it will discolour the eggs.\r\n<br>\r\nSTEP 3<br>\r\nPour in the egg mixture and let it sit, without stirring, for 20 seconds. Stir with a wooden spoon, lifting and folding it over from the bottom of the pan.\r\n<br>\r\nSTEP 4<br>\r\nLet it sit for another 10 seconds then stir and fold again.\r\n<br>\r\nSTEP 5<br>\r\nRepeat until the eggs are softly set and slightly runny in places. Remove from the heat and leave for a moment to finish cooking.\r\n<br>\r\nSTEP 6<br>\r\nGive a final stir and serve the velvety scramble without delay.	4	1	5	2023-02-03	jajecznica.jpg
28	Cucumber Soup	Heat oil in a large saucepan over medium-high heat. Add garlic and onion; cook, stirring occasionally, until tender, 1 to 4 minutes. Add lemon juice and cook for 1 minute. Add 3 3/4 cups cucumber slices, broth, salt, pepper and cayenne; bring to a simmer. Reduce heat and cook at a gentle simmer until the cucumbers are soft, 6 to 8 minutes.\r\n<br>\r\nStep 2<br>\r\nTransfer the soup to a blender. Add avocado and parsley; blend on low speed until smooth. (Use caution when pureeing hot liquids.) Pour into a serving bowl and stir in yogurt. Chop the remaining 1/4 cup cucumber slices. Serve the soup warm or refrigerate and serve it chilled. Just before serving, garnish with the chopped cucumber and more chopped parsley, if desired.	1	0	7	2023-02-04	cucumber-soup.png
26	Tomato Soup	STEP 1<br>\r\nFirst, prepare your vegetables. You need 1-1.25kg/2lb 4oz-2lb 12oz ripe tomatoes. If the tomatoes are on their vines, pull them off. The green stalky bits should come off at the same time, but if they don't, just pull or twist them off afterwards. Throw the vines and green bits away and wash the tomatoes. Now cut each tomato into quarters and slice off any hard cores (they don't soften during cooking and you'd get hard bits in the soup at the end). Peel 1 medium onion and 1 small carrot and chop them into small pieces. Chop 1 celery stick roughly the same size. /n\r\n<br>\r\nSTEP 2<br>\r\nSpoon 2 tbsp olive oil into a large heavy-based pan and heat it over a low heat. Hold your hand over the pan until you can feel the heat rising from the oil, then tip in the onion, carrot and celery and mix them together with a wooden spoon. Still with the heat low, cook the vegetables until they're soft and faintly coloured. This should take about 10 minutes and you should stir them two or three times so they cook evenly and don’t stick to the bottom of the pan. /n\r\n<br>\r\nSTEP 3<br>\r\nHolding the tube over the pan, squirt in about 2 tsp of tomato purée, then stir it around so it turns the vegetables red. Shoot the tomatoes in off the chopping board, sprinkle in a good pinch of sugar and grind in a little black pepper. Tear 2 bay leaves into a few pieces and throw them into the pan. Stir to mix everything together, put the lid on the pan and let the tomatoes stew over a low heat for 10 minutes until they shrink down in the pan and their juices flow nicely. From time to time, give the pan a good shake – this will keep everything well mixed. /n\r\n<br>\r\nSTEP 4<br>\r\nSlowly pour in the 1.2 litres/2 pints of hot stock (made with boiling water and 4 rounded tsp bouillon powder or 2 stock cubes), stirring at the same time to mix it with the vegetables. Turn up the heat as high as it will go and wait until everything is bubbling, then turn the heat down to low again and put the lid back on the pan. Cook gently for 25 minutes, stirring a couple of times. At the end of cooking the tomatoes will have broken down and be very slushy-looking.\r\n<br>\r\nSTEP 5<br>\r\nRemove the pan from the heat, take the lid off and stand back for a few seconds or so while the steam escapes, then fish out the pieces of bay leaf and throw them away. Ladle the soup into your blender until it’s about three-quarters full, fit the lid on tightly and turn the machine on full. Blitz until the soup’s smooth (stop the machine and lift the lid to check after about 30 seconds), then pour the puréed soup into a large bowl. Repeat with the soup that’s left in the pan. (The soup may now be frozen for up to three months. Defrost before reheating.)\r\n<br>\r\nSTEP 6<br>\r\nPour the puréed soup back into the pan and reheat it over a medium heat for a few minutes, stirring occasionally until you can see bubbles breaking gently on the surface. Taste a spoonful and add a pinch or two of salt if you think the soup needs it, plus more pepper and sugar if you like. If the colour’s not a deep enough red for you, plop in another teaspoon of tomato purée and stir until it dissolves. Ladle into bowls and serve. Or sieve and serve chilled with some cream swirled in.	1	3	5	2023-02-03	tomato-soup.png
29	Chicken and rice	Combine the paprika, oregano, thyme, garlic powder, onion powder, salt, and pepper in a small bowl. Coat both sides of the chicken thighs in the seasoning mix.<br>\r\nAdd 1 Tbsp cooking oil to a deep skillet and heat over medium. Once hot, swirl to coat the surface of the skillet, then add the chicken thighs. Cook the thighs for a few minutes on each side, or until well browned. The chicken does not need to be cooked through at this point.<br>\r\nRemove the browned chicken to a clean plate. Reduce the heat to medium-low, add an additional 1 Tbsp cooking oil to the skillet, then add the diced onion. Sauté the onion for about 5 minutes, or until softened. Allow the moisture from the onion to dissolve the browned bits from the skillet as you stir.<br>\r\nAdd the uncooked rice to the skillet and continue to sauté for 1-2 minutes more to toast the rice.<br>\r\nAdd the vegetable broth to the skillet and briefly stir to dissolve any remaining brown bits from the bottom of the skillet.<br>\r\nReturn the chicken to the skillet, setting it on top of the rice. Place a lid on the skillet, turn the heat up to medium-high, and allow the broth to come up to a full boil.<br>\r\nOnce boiling, turn the heat down to low and let the chicken and rice continue to simmer over low, without lifting the lid or stirring, for 20 minutes. After 20 minutes, turn off the heat and let it rest, without lifting the lid, for an additional 5 minutes.<br>\r\nFinally, remove the lid and fluff the rice around the chicken. Garnish with chopped parsley, if desired, then serve and enjoy!	0	0	7	2023-02-04	chicken-and-rice.png
31	Pork Chops	Step 1\r\n<br>Preheat oven to 375°. Season pork chops generously with salt and pepper.\r\n<br>Step 2\r\n<br>In a small bowl mix together butter, rosemary, and garlic. Set aside.\r\n<br>Step 3\r\n<br>In an oven safe skillet over medium-high heat, heat olive oil then add pork chops. Sear until golden, 4 minutes, flip and cook 4 minutes more. Brush pork chops generously with garlic butter.\r\n<br>Step 4\r\n<br>Place skillet in oven and cook until cooked through (145° for medium), 10-12 minutes. Serve with more garlic butter.	0	2	7	2023-02-04	porkchops.png
30	Wild mushroom, chicken & bacon risotto	STEP 1<br>\r\nSoak the dried mushrooms in 500ml boiling water for 20 mins, then drain the liquid into the stock. The mushrooms will have absorbed a lot of the liquid; you should have 1.5l in total. Chop the soaked mushrooms and add to the chestnut mushrooms.\r\n<br>\r\nSTEP 2<br>\r\nMake the risotto: start by frying the bacon in half the butter, then add the onion. When they are soft, add the mushrooms and continue to cook for a few mins until soft. Stir through the rice and continue as in the basic recipe. When you add the final ladle of stock, stir through the chicken to reheat. Add the chopped parsley with the Parmesan and remaining butter, leave to rest for a few mins, then stir through and serve.	0	0	7	2023-02-04	risotto.png
27	Mac and cheese	Step 1: Boil Macaroni<br>\r\nBring a pot of water to a boil. Cook elbow macaroni until al dente, about 8 minutes.\r\n<br>\r\nTip: For a thicker mac and cheese, double the amount of macaroni.\r\n<br>\r\nStep 2: Make a Roux<br>\r\nWhile the macaroni is cooking, go ahead and start on the roux. A roux is a thickening agent made of one part fat and one part flour that makes up the base of this creamy mac and cheese.\r\n<br>\r\nTo make the roux, start by melting butter in a saucepan over medium heat. Add flour, salt, and pepper and stir until smooth. Slowly pour in milk and stir until the mixture is smooth and bubbling. Be careful to not let the milk burn.\r\n<br>\r\nStep 3: Add Cheese and Macaroni<br>\r\nFinally, the most crucial step: Add cheese! Slowly stir in Cheddar cheese until smooth and melted. We recommend you grate your own cheese because pre-shredded cheese won't incorporate into the mixture as well as block cheese.\r\n<br>\r\nOnce the macaroni is finished cooking, drain and stir into cheese sauce until coated.	11	16	5	2023-02-03	macandcheese.png
\.


--
-- Data for Name: user_details; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.user_details (id, user_name, user_surname) FROM stdin;
1	Test	Testowy
2	Kamil	Naglik
3	Kamil	Naglik
4	Kamiil	Nagliik
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dbuser
--

COPY public.users (id, user_email, user_password, id_user_details) FROM stdin;
5	test@test.test	$2y$10$LujEn4DT2cN6FanoSpnlRuDvNw0lNjviZdMvVPLHhih1KzCizzZza	1
6	kamilnaglik@naglik.net	$2y$10$KDZ/YKdRYhMljDj3DfLnm.ZN2XzcCZX2LVbSd3z85yR9Alx9REf0m	2
7	pyruuss@gmail.com	$2y$10$W8bOUK2banc8Iirw1B/VNek0uPOmelrqAdwouu8BVtt63PQIKzLFG	2
8	knaglik@naglik.com	$2y$10$.OfVojJCDxk7boBmSMHiEuyULUL02pL9Qn.eMXCMIVPK0X7bUy8lu	4
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.products_id_seq', 18, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.recipes_id_seq', 35, true);


--
-- Name: user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.user_details_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dbuser
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: user_details user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.user_details
    ADD CONSTRAINT user_details_pkey PRIMARY KEY (id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: products_recipes products_recipes_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.products_recipes
    ADD CONSTRAINT products_recipes_products_id_fk FOREIGN KEY (id_product) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products_recipes products_recipes_recipes_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.products_recipes
    ADD CONSTRAINT products_recipes_recipes_id_fk FOREIGN KEY (id_recipe) REFERENCES public.recipes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recipes recipes_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_users_id_fk FOREIGN KEY (created_by) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_user_details_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: dbuser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_details_id_fk FOREIGN KEY (id_user_details) REFERENCES public.user_details(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

